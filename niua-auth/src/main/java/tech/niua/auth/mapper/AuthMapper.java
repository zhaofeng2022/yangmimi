package tech.niua.auth.mapper;

import tech.niua.auth.domain.SysRole;
import tech.niua.auth.domain.UserDetail;
import org.apache.ibatis.annotations.Param;

/**
 * @author :Zhaofeng
 * createAt: 2024/4/18
 */
public interface AuthMapper {
    /**
     * 根据用户名查找用户
     * @param name
     * @return
     */
    UserDetail findByUsername(@Param("name") String name);

    /**
     * 创建新用户
     * @param userDetail
     */
    void insert(UserDetail userDetail);

    /**
     * 创建用户角色
     * @param userId
     * @param roleId
     * @return
     */
    int insertRole(@Param("userId") long userId, @Param("roleId") long roleId);

    /**
     * 根据角色id查找角色
     * @param roleId
     * @return
     */
    SysRole findRoleById(@Param("roleId") long roleId);

    /**
     * 根据用户id查找该用户角色
     * @param userId
     * @return
     */
    SysRole findRoleByUserId(@Param("userId") long userId);
}
