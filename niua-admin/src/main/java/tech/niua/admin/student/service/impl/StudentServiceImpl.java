package tech.niua.admin.student.service.impl;

import com.baomidou.mybatisplus.extension.service.impl.ServiceImpl;
import org.springframework.stereotype.Service;
import tech.niua.admin.student.domain.Student;
import tech.niua.admin.student.mapper.StudentMapper;
import tech.niua.admin.student.service.IStudentService;

/**
 * <p>
 *   服务实现类
 * </p>
 *
 * @author niua
 * @since 2022-07-21 11:17:50
 */
@Service
public class StudentServiceImpl extends ServiceImpl<StudentMapper, Student> implements IStudentService {

}
