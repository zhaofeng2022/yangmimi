package tech.niua.common.exception;

import lombok.Getter;
import tech.niua.common.model.ResultJson;

/**
 * @author :Zhaofeng
 * createAt: 2024/4/18
 */
@Getter
public class CustomException extends RuntimeException{
    private ResultJson resultJson;

    public CustomException(ResultJson resultJson) {
        this.resultJson = resultJson;
    }
}
