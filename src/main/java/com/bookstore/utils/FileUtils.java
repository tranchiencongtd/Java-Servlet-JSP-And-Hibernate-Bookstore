package com.bookstore.utils;

import java.nio.file.Path;
import java.nio.file.Paths;

public class FileUtils {
    public static String combinePath(String... pathComponents) {
        Path combinedPath = Paths.get(pathComponents[0]);
        for (int i = 1; i < pathComponents.length; i++) {
            combinedPath = combinedPath.resolve(pathComponents[i]);
        }
        return combinedPath.toString();
    }
}