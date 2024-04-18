package tech.niua.admin.student.controller;

import com.baomidou.mybatisplus.core.conditions.query.QueryWrapper;
import com.baomidou.mybatisplus.core.metadata.IPage;
import com.baomidou.mybatisplus.extension.plugins.pagination.Page;
import tech.niua.admin.student.domain.Student;
import tech.niua.admin.student.service.IStudentService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.bind.annotation.*;
import tech.niua.core.annotation.ApiVersion;
import org.springframework.security.access.prepost.PreAuthorize;
import io.swagger.annotations.ApiImplicitParam;
import io.swagger.annotations.ApiImplicitParams;
import tech.niua.common.enums.BusinessType;
import tech.niua.common.model.ResultCode;
import tech.niua.common.model.ResultJson;
import java.util.Arrays;
import tech.niua.common.utils.poi.ExcelUtil;
import java.util.List;
import org.apache.commons.lang3.StringUtils;
import tech.niua.core.annotation.NoRepeatSubmit;
import tech.niua.core.annotation.Log;



/**
 * <p>
 *   控制类
 * </p>
 *
 * @author niua
 * @since 2022-07-21 11:17:50
 */
@RestController
@ApiVersion(1)
@RequestMapping("{version}/student")
public class StudentController {

    @Autowired
    private IStudentService studentService;

    /**
    * 查询列表
    *
    * @param currentPage
    * @param pageSize
    * @param student
    * @return
    */
    @Log(value = "查询列表", businessType = BusinessType.LIST)
    @PreAuthorize("hasAuthority('/student')")
    @ApiImplicitParams({@ApiImplicitParam(name = "Authorization", value = "Authorization token", required = true, dataType = "string", paramType = "header")})
    @PostMapping("/list/{currentPage}/{pageSize}")
    public ResultJson index(@PathVariable Integer currentPage, @PathVariable Integer pageSize,@RequestBody  Student student) {
        QueryWrapper<Student> queryWrapper = new QueryWrapper<>();

         if(StringUtils.isNotBlank(student.getName())) {
             queryWrapper.like("name", student.getName());
         }

         if(StringUtils.isNotBlank(student.getSex())) {
             queryWrapper.like("sex", student.getSex());
         }

         if(StringUtils.isNotBlank(student.getAge())) {
             queryWrapper.like("age", student.getAge());
         }


         if(StringUtils.isNotBlank(student.getSchool())) {
             queryWrapper.like("school", student.getSchool());
         }

         if(StringUtils.isNotBlank(student.getNianji())) {
             queryWrapper.like("nianji", student.getNianji());
         }

         if(StringUtils.isNotBlank(student.getState())) {
             queryWrapper.like("state", student.getState());
         }


         if(StringUtils.isNotBlank(student.getLeibie())) {
             queryWrapper.like("leibie", student.getLeibie());
         }



         if(StringUtils.isNotBlank(student.getSuoshu())) {
             queryWrapper.like("suoshu", student.getSuoshu());
         }

        IPage<Student> pageList = studentService.page(new Page<>(currentPage, pageSize), queryWrapper);
        return ResultJson.ok(pageList);
    }

    /**
    *根据id查找
    * @param: id
    * @return
    */
    @PreAuthorize("hasAuthority('/student')")
    @ApiImplicitParams({@ApiImplicitParam(name = "Authorization", value = "Authorization token", required = true, dataType = "string", paramType = "header")})
    @GetMapping("/findById/{id}")
    public ResultJson findStudentById(@PathVariable Long id) {
        Student student = studentService.getById(id);
        if(student != null){
            return ResultJson.ok(student);
        }
        return ResultJson.failure(ResultCode.BAD_REQUEST);
    }

    /**
    * 添加修改
    * @param student
    * @return
    */
    @Log(value = "添加修改", businessType = BusinessType.INSERTORUPDATE)
    @PreAuthorize("hasAuthority('/student/saveOrUpdate')")
    @NoRepeatSubmit
    @ApiImplicitParams({@ApiImplicitParam(name = "Authorization", value = "Authorization token", required = true, dataType = "string", paramType = "header")})
    @PostMapping("/saveOrUpdate")
    public ResultJson saveOrUpdate(@RequestBody Student student){
        boolean flag = studentService.saveOrUpdate(student);
        if(flag){
            return ResultJson.ok();
        }
        return ResultJson.failure(ResultCode.NOT_UPDATE);
    }

    /**
    * 删除
    * @param ids
    * @return
    */
    @Log(value = "删除", businessType = BusinessType.DELETE)
    @PreAuthorize("hasAuthority('/student/delete')")
    @ApiImplicitParams({@ApiImplicitParam(name = "Authorization", value = "Authorization token", required = true, dataType = "string", paramType = "header")})
    @GetMapping("/delete")
    public ResultJson delete(@RequestParam("ids") Long[] ids){
//        boolean flag = studentService.removeByIds(Arrays.asList(ids));
        List<Long> longs = Arrays.asList(ids);
        Long aLong = longs.get(0);
        Student student = studentService.getById(aLong);
        student.setState("0");
        studentService.saveOrUpdate(student);
        if(student != null){
            return ResultJson.ok(student);
        }
        return ResultJson.failure(ResultCode.BAD_REQUEST);
    }

    /**
    * 数据导出
    * @return
    */
    @Log(value = "数据导出", businessType = BusinessType.EXPORT)
    @PreAuthorize("hasAuthority('/student/export')")
    @GetMapping("/export")
    public ResultJson export(Student student) {
        List<Student> list = studentService.list();
        ExcelUtil<Student> util = new ExcelUtil<>(Student.class);
        return util.exportExcel(list, "自动生成数据");
    }

}

