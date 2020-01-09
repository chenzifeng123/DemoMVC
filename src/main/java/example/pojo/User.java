package example.pojo;

import java.io.Serializable;

//这里我开了mybatis二级缓存 要实现序列化接口 Serializable
public class User implements Serializable {
    private static final long serialVersionUID = -5809782578272943999L;

    private Integer id;
    private String username;
    private String password;

    public Integer getId() {
        return id;
    }

    public void setId(Integer id) {
        this.id = id;
    }

    public String getUsername() {
        return username;
    }

    public void setUsername(String username) {
        this.username = username;
    }

    public String getPassword() {
        return password;
    }

    public void setPassword(String password) {
        this.password = password;
    }
}
