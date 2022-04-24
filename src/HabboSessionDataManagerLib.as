// by nota

//HabboSessionDataManagerLib

package 
{
    import mx.core.SimpleApplication;
    import com.sulake.bootstrap.SessionDataManagerBootstrap;
    import com.sulake.iid.IIDSessionDataManager;

    [SecureSWF(rename="false")]
    public class HabboSessionDataManagerLib extends SimpleApplication 
    {

        public static var requiredClasses:Array = new Array(SessionDataManagerBootstrap, IIDSessionDataManager);
        public static var manifest:Class = _SafeStr_2596;
        public static var loading_icon:Class = _SafeStr_2581;


    }
}//package 

// _SafeStr_2581 = "loading_icon_png$59be220c7b09816f88e3cee7ed183485-1435771455" (String#19476, DoABC#4)
// _SafeStr_2596 = "manifest_xml$266cbce7cb2e18acabdde4c854d66537-2022049168" (String#21997, DoABC#4)


