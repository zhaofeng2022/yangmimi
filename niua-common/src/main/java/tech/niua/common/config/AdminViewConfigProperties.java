package tech.niua.common.config;

import lombok.Data;
import org.springframework.boot.context.properties.ConfigurationProperties;
import org.springframework.context.annotation.Configuration;

/**
 * @author :Zhaofeng
 * @title: AdminViewConfigProperties
 * @projectName aesthetics
 * @description: 绑定后台静态页面访问参数
 * @date 2021/4/20 下午6:24
 */

@Configuration
@ConfigurationProperties(prefix = "view")
@Data
public class AdminViewConfigProperties {
    private String path;

    private String resourceLocations;

}
