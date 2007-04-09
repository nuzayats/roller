
package org.roller.pojos;


/**
 * Role bean.
 * @author David M Johnson
 *
 * @ejb:bean name="RoleData"
 * @struts.form include-all="true"
 * @hibernate.class table="userrole"  
 * hibernate.jcs-cache usage="read-write"
 */
public class RoleData
   extends org.roller.pojos.PersistentObject
   implements java.io.Serializable
{
   static final long serialVersionUID = -4254083071697970972L;

   protected java.lang.String id;
   protected java.lang.String userName;
   protected UserData user;
   protected java.lang.String role;

   public RoleData()
   {
   }

   public RoleData(String id, UserData user, String role)
   {
      this.id = id;
      this.userName = user.getUserName();
      this.user = user;
      this.role = role;
   }

   public RoleData( RoleData otherData )
   {
      this.id = otherData.id;
      this.userName = otherData.userName;
      this.user = otherData.user;
      this.role = otherData.role;

   }

   /** 
    * @ejb:pk-field
    * @ejb:persistent-field 
    * @hibernate.id column="id" type="string"
    *  generator-class="uuid.hex" unsaved-value="null"
    */
   public java.lang.String getId()
   {
      return this.id;
   }
   /** @ejb:persistent-field */ 
   public void setId( java.lang.String id )
   {
      this.id = id;
   }

   /** 
    * @ejb:persistent-field 
    * @hibernate.property column="username" non-null="true" unique="false"
    */
   public java.lang.String getUserName()
   {
      return this.userName;
   }
   /** @ejb:persistent-field */ 
   public void setUserName( java.lang.String userName )
   {
      this.userName = userName;
   }

   /** 
    * @hibernate.many-to-one column="userid" cascade="none" not-null="true"
    * @ejb:persistent-field 
    */
   public UserData getUser()
   {
      return this.user;
   }
   /** @ejb:persistent-field */ 
   public void setUser( UserData user )
   {
      this.user = user;
   }

   /** 
    * @ejb:persistent-field 
    * @hibernate.property column="rolename" non-null="true" unique="false"
    */
   public java.lang.String getRole()
   {
      return this.role;
   }
   /** @ejb:persistent-field */ 
   public void setRole( java.lang.String role )
   {
      this.role = role;
   }

   public String toString()
   {
      StringBuffer str = new StringBuffer("{");

      str.append("id=" + id + " " + "userName=" + userName + " " + "user=" + user + " " + "role=" + role);
      str.append('}');

      return(str.toString());
   }

   public boolean equals( Object pOther )
   {
      if( pOther instanceof RoleData )
      {
         RoleData lTest = (RoleData) pOther;
         boolean lEquals = true;

         if( this.id == null )
         {
            lEquals = lEquals && ( lTest.id == null );
         }
         else
         {
            lEquals = lEquals && this.id.equals( lTest.id );
         }
         if( this.userName == null )
         {
            lEquals = lEquals && ( lTest.userName == null );
         }
         else
         {
            lEquals = lEquals && this.userName.equals( lTest.userName );
         }
         if( this.user == null )
         {
            lEquals = lEquals && ( lTest.user == null );
         }
         else
         {
            lEquals = lEquals && this.user.equals( lTest.user );
         }
         if( this.role == null )
         {
            lEquals = lEquals && ( lTest.role == null );
         }
         else
         {
            lEquals = lEquals && this.role.equals( lTest.role );
         }

         return lEquals;
      }
      else
      {
         return false;
      }
   }

   public int hashCode()
   {
      int result = 17;
      result = 37*result + ((this.id != null) ? this.id.hashCode() : 0);
      result = 37*result + ((this.userName != null) ? this.userName.hashCode() : 0);
      result = 37*result + ((this.user != null) ? this.user.hashCode() : 0);
      result = 37*result + ((this.role != null) ? this.role.hashCode() : 0);
      return result;
      }

   /**
	* Setter is needed in RollerImpl.storePersistentObject()
    */
   public void setData( org.roller.pojos.PersistentObject otherData )
   {

      this.id = ((RoleData)otherData).id;

      this.userName = ((RoleData)otherData).userName;

      this.user = ((RoleData)otherData).user;

      this.role = ((RoleData)otherData).role;
   }

}