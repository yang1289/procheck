package procheck.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import procheck.model.Permission;
import procheck.model.ProTable;
import procheck.service.PermissionService;
import procheck.service.ProTableService;

import java.util.HashSet;
import java.util.List;
import java.util.Set;

/**
 * Created by Administrator on 2017/3/14.
 */
@Controller
@RequestMapping("/protable")
public class ProTableController {

    @Autowired
    private ProTableService proTableService;

    @Autowired
    private PermissionService permissionService;

    @GetMapping("/add")
    public String addProTable(Model model){
        List<Permission> permissions=permissionService.findByPidGreaterThan(0) ;
        model.addAttribute("childPermissions",permissions);
        return "/protable/addTable";
    }

    @PostMapping("/add")
    public String addedProTable(String tablename,String tabledescription,Integer allowPermission,String tablevalue,Model model){
        Set<Permission> addpermissions=new HashSet<>();
        ProTable proTable=new ProTable();
        proTable.setName(tablename);
        proTable.setDescription(tabledescription);
        proTable.setTableValue(tablevalue);
        System.out.println("allowPermission:====="+allowPermission);
        if(allowPermission!=null){
            addpermissions.add(permissionService.findById(allowPermission));
        }
        proTable.setPermissions(addpermissions);
        System.out.println("permission.size():====="+proTable.getPermissions().size());
        proTableService.save(proTable);

        List<Permission> permissions=permissionService.findByPidGreaterThan(0) ;
        model.addAttribute("message","设置成功");
        model.addAttribute("childPermissions",permissions);
        return "/protable/addTable";
    }

}
