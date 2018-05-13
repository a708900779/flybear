package flybear.hziee.app.mapper;


import flybear.hziee.app.model.Mailbox;
import java.util.List;

public interface MailboxMapper {
    int deleteByPrimaryKey(Integer id);

    int insert(Mailbox record);

    Mailbox selectByPrimaryKey(Integer id);

    List<Mailbox> selectAll();

    int updateByPrimaryKey(Mailbox record);
    
}