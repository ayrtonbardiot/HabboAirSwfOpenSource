// by nota

//com.sulake.habbo.utils.ExtendedProfileIcon

package com.sulake.habbo.utils
{
    import com.sulake.core.window._SafeStr_3109;
    import com.sulake.core.window._SafeStr_3133;
    import com.sulake.core.window.components.IRegionWindow;
    import com.sulake.core.window.events._SafeStr_3116;

    public class ExtendedProfileIcon 
    {


        public static function setup(_arg_1:_SafeStr_3133, _arg_2:Function):void
        {
            var _local_3:_SafeStr_3109 = _arg_1.findChildByName("user_info_region");
            _local_3.addEventListener("WME_OVER", onUserInfoMouseOver);
            _local_3.addEventListener("WME_OUT", onUserInfoMouseOut);
            _local_3.addEventListener("WME_CLICK", _arg_2);
        }

        private static function onUserInfoMouseOver(_arg_1:_SafeStr_3116):void
        {
            var _local_2:IRegionWindow = IRegionWindow(_arg_1.target);
            setUserInfoState(true, _local_2);
        }

        private static function onUserInfoMouseOut(_arg_1:_SafeStr_3116):void
        {
            var _local_2:IRegionWindow = IRegionWindow(_arg_1.target);
            setUserInfoState(false, _local_2);
        }

        public static function setUserInfoState(_arg_1:Boolean, _arg_2:_SafeStr_3133):void
        {
            _arg_2.findChildByName("icon_eye_off").visible = (!(_arg_1));
            _arg_2.findChildByName("icon_eye_over").visible = _arg_1;
        }

        public static function onEntry(_arg_1:_SafeStr_3116, _arg_2:_SafeStr_3109):void
        {
            if (_arg_1.type == "WME_OVER")
            {
                ExtendedProfileIcon.setUserInfoState(true, _SafeStr_3133(_arg_2.parent));
            }
            else
            {
                if (_arg_1.type == "WME_OUT")
                {
                    ExtendedProfileIcon.setUserInfoState(false, _SafeStr_3133(_arg_2.parent));
                };
            };
        }


    }
}//package com.sulake.habbo.utils

// _SafeStr_3109 = "_-s1L" (String#23, DoABC#4)
// _SafeStr_3116 = "_-XC" (String#59, DoABC#4)
// _SafeStr_3133 = "_-U1F" (String#18, DoABC#4)


