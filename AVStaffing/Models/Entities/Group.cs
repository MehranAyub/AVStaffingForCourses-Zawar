using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.ComponentModel.DataAnnotations.Schema;
using AVStaffing.Infrastructure;
using AVStaffing.Models.Constants;

namespace AVStaffing.Models.Entities
{
    [Table(nameof(PrivateChat), Schema = Schemas.Chat)]
    public class PrivateChat
    {
        [Key]
        public int Id { get; set; }
        public int UserFromId { get; set; }
        [ForeignKey(nameof(UserFromId))]
        public ApplicationUser UserFrom { get; set; }
        public int UserToId { get; set; }
        [ForeignKey(nameof(UserToId))]
        public ApplicationUser UserTo { get; set; }

        public string Message { get; set; }
        public DateTime TimeStamp { get; set; }

        public string FilePath { get; set; }
        public string Type { get; set; }
        public string FileDetails { get; set; }

        [NotMapped]
        public string UserFromContextId { get; set; }
        [NotMapped]
        public string UserToContextId { get; set; }
        [NotMapped]
        public string UserImage { get; set; }
        [NotMapped]
        public string SenderName { get; set; }
    }



    [Table(nameof(GroupChat), Schema = Schemas.Chat)]
    public class GroupChat
    {
        [Key]
        public int Id { get; set; }
        public string Message { get; set; }
        public string FilePath { get; set; }
        public string Type { get; set; }
        public string FileDetails { get; set; }

        public int GroupId { get; set; }
        [ForeignKey(nameof(GroupId))]
        public Group Group { get; set; }
        public int UserId { get; set; }

        [ForeignKey(nameof(UserId))]
        public ApplicationUser User { get; set; }

        public DateTime TimeStamp { get; set; }
        [NotMapped]
        public string UserImage { get; set; }
        [NotMapped]
        public string SenderName { get; set; }
    }

    [Table(nameof(Group), Schema = Schemas.Chat)]
    public class Group
    {
        [Key]
        public int Id { get; set; }
        public string Name { get; set; }
        public List<GroupChat> GroupChat { get; set; }
        public bool IsDeleted { get; set; }
    }

}