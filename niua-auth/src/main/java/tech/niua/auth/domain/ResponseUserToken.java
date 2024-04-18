package tech.niua.auth.domain;

import lombok.AllArgsConstructor;
import lombok.Data;

/**
 * @author :Zhaofeng
 * createAt: 2024/4/18
 */
@Data
@AllArgsConstructor
public class ResponseUserToken {
    private String token;
    private UserDetail userDetail;
}
