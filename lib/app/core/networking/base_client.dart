import 'dart:async';
import 'dart:io';

import 'package:bhola_tradings/app/core/networking/string_enum.dart';
import 'package:dio/dio.dart';
import 'package:pretty_dio_logger/pretty_dio_logger.dart';

import '../constant/custom_snackbar.dart';
import 'api_exceptions.dart';

enum RequestType {
  get,
  post,
  put,
  delete,
  patch,
}

class BaseClient {
  final Dio _dio = Dio()
    ..interceptors.add(PrettyDioLogger(
      requestHeader: true,
      requestBody: true,
      responseBody: true,
      responseHeader: false,
      error: true,
      compact: true,
      maxWidth: 90,
    ));

  /// dio getter (used for testing)
  get dio => _dio;

  /// perform safe api request
  safeApiCall(
      String url,
      RequestType requestType, {
        Map<String, dynamic>? headers,
        Map<String, dynamic>? queryParameters,
        required Function(Response response) onSuccess,
        Function(ApiException)? onError,
        Function(int value, int progress)? onReceiveProgress,
        Function(int total, int progress)?
        onSendProgress, // while sending (uploading) progress
        Function? onLoading,
        dynamic data,
      }) async {
    try {
      // 1) indicate loading state
      await onLoading?.call();
      // 2) try to perform http request
      late Response response;
      if (requestType == RequestType.get) {
        response = await _dio.get(
          url,
          onReceiveProgress: onReceiveProgress,
          queryParameters: queryParameters,
          options: Options(
            headers: headers,
          ),
        );
      } else if (requestType == RequestType.post) {
        response = await _dio.post(
          url,
          data: data,
          onReceiveProgress: onReceiveProgress,
          onSendProgress: onSendProgress,
          queryParameters: queryParameters,
          options: Options(headers: headers),
        );
      } else if (requestType == RequestType.put) {
        response = await _dio.put(
          url,
          data: data,
          onReceiveProgress: onReceiveProgress,
          onSendProgress: onSendProgress,
          queryParameters: queryParameters,
          options: Options(headers: headers),
        );
      }  else if (requestType == RequestType.patch) {
        response = await _dio.patch(
          url,
          data: data,
          onReceiveProgress: onReceiveProgress,
          onSendProgress: onSendProgress,
          queryParameters: queryParameters,
          options: Options(headers: headers),
        );
      } else {
        response = await _dio.delete(
          url,
          data: data,
          queryParameters: queryParameters,
          options: Options(headers: headers),
        );
      }
      // 3) return response (api done successfully)
      await onSuccess(response);
      // ignore: deprecated_member_use
    } on DioError catch (error) {
      print(error.response);
      print(error);
      // dio error (api reach the server but not performed successfully
      _handleDioError(error: error, url: url, onError: onError);

    } on SocketException {
      // No internet connection
      _handleSocketException(url: url, onError: onError);
    } on TimeoutException {
      // Api call went out of time
      _handleTimeoutException(url: url, onError: onError);
    } catch (error) {
      // unexpected error for example (parsing json error)
      _handleUnexpectedException(url: url, onError: onError, error: error);

    }
  }

  /// download file
   download(
      {required String url, // file url
        required String savePath, // where to save file
        Function(ApiException)? onError,
        Function(int value, int progress)? onReceiveProgress,
        required Function onSuccess}) async {
    try {
      await _dio.download(
        url,
        savePath,
        options: Options(
            receiveTimeout: const Duration(milliseconds: 9999),
            sendTimeout: const Duration(milliseconds: 9999)),
        onReceiveProgress: onReceiveProgress,
      );
      onSuccess();
    } catch (error) {
      var exception = ApiException(url: url, message: error.toString());
      onError?.call(exception) ?? _handleError(error.toString());
    }
  }

  /// handle unexpected error
   _handleUnexpectedException(
      {Function(ApiException)? onError,
        required String url,
        required Object error}) {
    if (onError != null) {
      onError(ApiException(
        message: error.toString(),
        url: url,
      ));
    } else {
      _handleError(error.toString());
    }
  }

  /// handle timeout exception
   _handleTimeoutException(
      {Function(ApiException)? onError, required String url}) {
    if (onError != null) {
      onError(ApiException(
        message: Strings.serverNotResponding,
        url: url,
      ));
    } else {
      _handleError(Strings.serverNotResponding);
    }
  }

  /// handle timeout exception
   _handleSocketException(
      {Function(ApiException)? onError, required String url}) {
    if (onError != null) {
      onError(ApiException(
        message: Strings.noInternetConnection,
        url: url,
      ));
    } else {
      _handleError(Strings.noInternetConnection);
    }
  }

  /// handle Dio error
   _handleDioError(
      // ignore: deprecated_member_use
          {required DioError error,
        Function(ApiException)? onError,
        required String url}) {
    // 404 error
    if (error.response?.statusCode == 404) {
      print(error.response);
      if (onError != null) {
        return onError(ApiException(
          message: Strings.urlNotFound,
          url: url,
          statusCode: 404,
          response: error.response
        ));
      } else {
        return _handleError(Strings.urlNotFound);
      }
    }

    if (error.response?.statusCode == 400) {
      print("-------------bb-ccc----------");
      print(error.response!.data);
      print("-------------bb-ccc----------");

      if (onError != null) {
        return onError(ApiException(
            message: Strings.urlNotFound,
            url: url,
            statusCode: 400,
            response: error.response
        ));
      } else {
        return _handleError(Strings.urlNotFound);
      }
    }

    if (error.response?.statusCode == 500) {
      // print(error.response);
      if (onError != null) {
        _handleError(Strings.serverNotResponding);
        return onError(ApiException(
            message: Strings.urlNotFound,
            url: url,
            statusCode: 500,
            response: error.response
        ));
      } else {
        return _handleError(Strings.serverNotResponding);
      }
    }

    // no internet connection
    if (error.message!.toLowerCase().contains('socket')) {
      if (onError != null) {
        return onError(ApiException(
          message: Strings.noInternetConnection,
          url: url,
        ));
      } else {
        return _handleError(Strings.noInternetConnection);
      }
    }

    // check if the error is 500 (server problem)
    if (error.response?.statusCode == 500) {
      var exception = ApiException(
        message: Strings.serverError,
        url: url,
        statusCode: 500,
      );

      if (onError != null) {
        return onError(exception);
      } else {
        return handleApiError(exception);
      }
    }

    // check if the error is 413 (Content to large)
    if (error.response?.statusCode == 413) {
      var exception = ApiException(
        message: Strings.serverError,
        url: url,
        statusCode: 413,
      );

      if (onError != null) {
        return onError(exception);
      } else {
        return handleApiError(exception);
      }
    }

    // check if the error is 401 (Unauthorized Request)
    if (error.response?.statusCode == 401) {
      var exception = ApiException(
        message: Strings.unauthorised,
        url: url,
        statusCode: 401,
      );



      if (onError != null) {
        return onError(exception);
      } else {
        return handleApiError(exception);
      }
    }

    var exception = ApiException(
        url: url,
        message: error.message.toString(),
        response: error.response,
        statusCode: error.response?.statusCode);
    if (onError != null) {
      return onError(exception);
    } else {
      return handleApiError(exception);
    }
  }

  /// handle error automaticly (if user didnt pass onError) method
  /// it will try to show the message from api if there is no message
  /// from api it will show the reason (the dio message)
   handleApiError(ApiException apiException) {
    String msg = apiException.toString();
    CustomSnackBar.showCustomErrorToast(message: msg, title: '');
  }

  /// handle errors without response (500, out of time, no internet,..etc)
   _handleError(String msg) {
    CustomSnackBar.showCustomErrorToast(message: msg, title: '');
  }
}
