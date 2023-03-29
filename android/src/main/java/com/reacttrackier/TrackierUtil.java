package com.reacttrackier;

import java.util.Map;
import java.util.HashMap;
import javax.annotation.Nullable;
import com.facebook.react.bridge.*;

import static com.facebook.react.bridge.Arguments.toList;

public class TrackierUtil {

    public static Map<String, Object> toMap(@Nullable ReadableMap readableMap) {
        if (readableMap == null) {
            return null;
        }
        com.facebook.react.bridge.ReadableMapKeySetIterator iterator = readableMap.keySetIterator();
        if (!iterator.hasNextKey()) {
            return null;
        }
        Map<String, Object> result = new HashMap<>();
        while (iterator.hasNextKey()) {
            String key = iterator.nextKey();
            String value = toObject(readableMap, key).toString();

            result.put(key, value);
        }
        return result;
    }

    private static Object toObject(@Nullable ReadableMap readableMap, String key) {
        if (readableMap == null) {
            return null;
        }
        Object result = null;
        ReadableType readableType = readableMap.getType(key);
        switch (readableType) {
            case Null:
                result = null;
                break;
            case Boolean:
                result = readableMap.getBoolean(key);
                break;
            case Number:
                // Can be int or double.
                double tmp = readableMap.getDouble(key);
                if (tmp == (int)tmp) {
                    result = (int)tmp;
                } else {
                    result = tmp;
                }
                break;
            case String:
                result = readableMap.getString(key);
                break;
            case Map:
                result = toMap(readableMap.getMap(key));
                break;
            case Array:
                result = toList(readableMap.getArray(key));
                break;
            default:
        }
        return result;
    }
}
