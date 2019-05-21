package com.webchat.handler;

import org.apache.ibatis.type.BaseTypeHandler;
import org.apache.ibatis.type.JdbcType;

import java.sql.CallableStatement;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.List;

public class ListStringHandler extends BaseTypeHandler<List<String>> {

    public void setNonNullParameter(PreparedStatement ps, int i, List<String> parameter, JdbcType jdbcType) throws SQLException {
        if (parameter != null && parameter.size() > 0) {
            StringBuffer sb = new StringBuffer();
            for (String s : parameter) {
                sb.append(sb).append(";");
            }
            ps.setString(i, sb.toString());
        }
    }

    public List<String> getNullableResult(ResultSet rs, String columnName) throws SQLException {
        String s = rs.getString(columnName);
        if (s != null && !"".equals(s)) {
            return new ArrayList<String>(Arrays.asList(s.split(";")));
        }
        return null;
    }

    public List<String> getNullableResult(ResultSet rs, int columnIndex) throws SQLException {
        String s = rs.getString(columnIndex);
        if (s != null && !"".equals(s)) {
            return new ArrayList<String>(Arrays.asList(s.split(";")));
        }
        return null;
    }

    public List<String> getNullableResult(CallableStatement cs, int columnIndex) throws SQLException {
        String s = cs.getString(columnIndex);
        if (s != null && !"".equals(s)) {
            return new ArrayList<String>(Arrays.asList(s.split(";")));
        }
        return null;
    }
}
