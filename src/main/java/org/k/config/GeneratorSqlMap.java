package org.k.config;

import org.mybatis.generator.api.MyBatisGenerator;
import org.mybatis.generator.config.Configuration;
import org.mybatis.generator.config.xml.ConfigurationParser;
import org.mybatis.generator.internal.DefaultShellCallback;
import java.io.File;
import java.util.ArrayList;
import java.util.List;

public class GeneratorSqlMap {
    static void generator() throws Exception{
        List<String> warnings= new ArrayList<>();
        boolean overwrite=true;
        File configFile=new File("C:\\Users\\26591\\Documents\\tool\\Code\\Java\\ssm\\src\\main\\resources\\GeneratorConfig.xml");
        ConfigurationParser  configurationParser=new ConfigurationParser(warnings);
        Configuration configuration=configurationParser.parseConfiguration(configFile);
        DefaultShellCallback defaultShellCallback=new DefaultShellCallback(overwrite);
        MyBatisGenerator myBatisGenerator=new MyBatisGenerator(configuration,defaultShellCallback,warnings);
        myBatisGenerator.generate(null);
    }
}
