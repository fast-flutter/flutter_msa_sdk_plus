package com.adtalos.flutter.msa.sdk;

import android.content.Context;

import androidx.annotation.NonNull;

import com.github.gzuliyujiang.oaid.DeviceID;
import com.github.gzuliyujiang.oaid.IGetter;

import io.flutter.embedding.engine.plugins.FlutterPlugin;
import io.flutter.plugin.common.MethodCall;
import io.flutter.plugin.common.MethodChannel;
import io.flutter.plugin.common.MethodChannel.MethodCallHandler;
import io.flutter.plugin.common.MethodChannel.Result;

/**
 * FlutterMsaSdkPlusPlugin
 */
public class FlutterMsaSdkPlusPlugin implements FlutterPlugin, MethodCallHandler {
    private Context context;
    private MethodChannel channel;

    @Override
    public void onAttachedToEngine(@NonNull FlutterPluginBinding binding) {
        channel = new MethodChannel(binding.getBinaryMessenger(), "flutter_msa_sdk_plus");
        channel.setMethodCallHandler(this);
        context = binding.getApplicationContext();
    }

    @Override
    public void onDetachedFromEngine(@NonNull FlutterPluginBinding binding) {
        if (channel != null) {
            channel.setMethodCallHandler(null);
        }
    }

    @Override
    public void onMethodCall(@NonNull MethodCall call, @NonNull final Result result) {
        switch (call.method) {
            case "getPlatformVersion":
                result.success("Android " + android.os.Build.VERSION.RELEASE);
                return;
            case "isSupport":
                result.success(DeviceID.supportedOAID(context));
                return;
            case "getOAID":
                DeviceID.getOAID(context, new IGetter() {
                    @Override
                    public void onOAIDGetComplete(@NonNull String oaid) {
                        result.success(oaid);
                    }

                    @Override
                    public void onOAIDGetError(@NonNull Throwable error) {
                        result.success("ooxx");
                    }
                });
                return;
            default:
                result.notImplemented();
        }
    }
}
