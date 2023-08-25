/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package com.footy.blog.helper;

import jakarta.servlet.annotation.MultipartConfig;
import java.io.FileOutputStream;
import java.io.InputStream;

/**
 *
 * @author shubh
 */
@MultipartConfig
public class Helper {
    
    public static boolean saveFile(InputStream is, String path) {
        boolean f= false;
        
        try {
            byte b[] = new byte[is.available()];
            
            is.read(b);
            
            FileOutputStream fos = new FileOutputStream(path); 
            
            fos.write(b);
            fos.close();
            f = true;
            
        } catch(Exception e) {
            e.printStackTrace();
        }
        
        return f;
        
    }
    
}
