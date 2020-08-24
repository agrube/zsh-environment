#if (${PACKAGE_NAME} && ${PACKAGE_NAME} != "")package ${PACKAGE_NAME};#end

import com.solipsys.dynamicloader.Plugin;
import com.solipsys.property.Getter;
import com.solipsys.property.PropertyContext;

#parse("File Header.java")
public class ${NAME} implements Getter, Plugin {
  final static long serialVersionUID = 1L;

  private final static Class<?>[] HANDLES = { ${HANDLES}.class };

  /**
   * Default constructor
   **/
  public ${NAME}()
  {
  }

  /**
   * The classes this getter can handle
   **/
  @Override
  public Class<?>[] getObjectClass()
  {
    return HANDLES;
  }

  /**
   * The type of any optional data passed to the get method
   **/
  @Override
  public Class<?> getDataClass()
  {
    return null;
  }

  /**
   * The property name of the getter: "${PROPERTY_NAME}"
   **/
  @Override
  public String getPropertyName()
  {
    return "${PROPERTY_NAME}";
  }

  /**
   * The type of object that will be returned, ${RETURN_TYPE}.class
   **/
  @Override
  public Class<?> getReturnClass()
  {
    return ${RETURN_TYPE}.class;
  }

  /**
   * {@inheritDoc}
   */
  @Override
  public Object get( PropertyContext cxt, Object obj )
  {
    if ( obj instanceof ${HANDLES} )
    {
			// TODO Implement Getter
    }
    return null;
  }
}
