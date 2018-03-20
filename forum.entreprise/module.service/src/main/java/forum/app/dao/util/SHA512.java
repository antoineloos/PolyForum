/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package forum.app.dao.util;


import org.apache.commons.codec.digest.DigestUtils;

/**
 * SHA512 hashing sample with plain Java. Uses a salt, configures the number of
 * iterations and calculates the hash value.
 * <p/>
 * Uses Google Guava to hex the hash in a readable format.
 *
 * @author Dominik Schadow
 */
public class SHA512 {

  
    private static final String SALT = "ThisIsMySaltForAddedSecurity";

    /**
     * Private constructor.
     */
    public static String generatePassword(String pwd) {
        
       return DigestUtils.sha512Hex(pwd + SALT);

    }
}
