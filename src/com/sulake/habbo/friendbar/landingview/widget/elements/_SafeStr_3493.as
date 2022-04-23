// Decompiled by AS3 Sorcerer 6.30
// www.as3sorcerer.com

//com.sulake.habbo.friendbar.landingview.widget.elements._SafeStr_3493

package com.sulake.habbo.friendbar.landingview.widget.elements
{
    import com.sulake.habbo.friendbar.landingview.interfaces.elements.IElementHandler;
    import com.sulake.core.window._SafeStr_3133;
    import com.sulake.core.window.components.IStaticBitmapWrapperWindow;
    import com.sulake.habbo.friendbar.landingview.HabboLandingView;
    import com.sulake.core.window._SafeStr_3109;
    import com.sulake.habbo.friendbar.landingview.widget.GenericWidget;

    public class _SafeStr_3493 implements IElementHandler 
    {


        public function initialize(_arg_1:HabboLandingView, _arg_2:_SafeStr_3109, _arg_3:Array, _arg_4:GenericWidget):void
        {
            var _local_8:String = _arg_3[2];
            var _local_5:_SafeStr_3133 = _SafeStr_3133(_arg_2);
            _local_5.findChildByName("badge_desc").caption = "";
            var _local_6:IStaticBitmapWrapperWindow = IStaticBitmapWrapperWindow(_local_5.findChildByName("badge_image"));
            var _local_7:String = (("${image.library.url}album1584/" + _arg_3[1]) + ".png");
            _SafeStr_14.log(("IMAGE: " + _local_7));
            _local_6.assetUri = _local_7;
        }

        public function refresh():void
        {
        }


    }
}//package com.sulake.habbo.friendbar.landingview.widget.elements

// _SafeStr_14 = "_-ED" (String#155, DoABC#4)
// _SafeStr_3109 = "_-s1L" (String#23, DoABC#4)
// _SafeStr_3133 = "_-U1F" (String#18, DoABC#4)
// _SafeStr_3493 = "_-21x" (String#14761, DoABC#4)


