package tech.niua.admin.student.domain;

import com.baomidou.mybatisplus.annotation.*;
import com.fasterxml.jackson.annotation.JsonFormat;
import io.swagger.annotations.ApiModelProperty;
import lombok.Builder;
import lombok.Data;
import tech.niua.common.annotation.Excel;

import java.time.LocalDateTime;

/**
* @className: Generator
* @description: 
* @author: niua
* @since 2022-07-21 11:17:50
*
*/
@Builder
@Data
@TableName("student")
public class Student {

        @TableId(type = IdType.AUTO)
        @Excel(name = "序号", cellType = Excel.ColumnType.NUMERIC)
        private Integer id;

        @Excel(name = "")
        private String name;

        @Excel(name = "")
        private String sex;

        @Excel(name = "")
        private String age;

        @Excel(name = "")
        private Integer classid;

        @Excel(name = "")
        private String school;

        @Excel(name = "")
        private String nianji;

        @Excel(name = "")
        private String state;

        @Excel(name = "")
        private LocalDateTime time;

        @Excel(name = "")
        private String leibie;

        @Excel(name = "")
        private Long phone;

        @Excel(name = "")
        private Long code;

        @Excel(name = "")
        private String suoshu;





}
