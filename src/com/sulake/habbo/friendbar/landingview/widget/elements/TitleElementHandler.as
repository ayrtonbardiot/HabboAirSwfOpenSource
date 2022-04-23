// Decompiled by AS3 Sorcerer 6.30
// www.as3sorcerer.com

//com.sulake.habbo.friendbar.landingview.widget.elements.TitleElementHandler

package com.sulake.habbo.friendbar.landingview.widget.elements
{
    import com.sulake.habbo.friendbar.landingview.interfaces.elements.IElementHandler;
    import com.sulake.habbo.friendbar.landingview.interfaces.elements._SafeStr_3491;
    import com.sulake.core.window._SafeStr_3133;
    import com.sulake.habbo.friendbar.landingview.HabboLandingView;
    import com.sulake.core.window._SafeStr_3109;
    import com.sulake.habbo.friendbar.landingview.widget.GenericWidget;

    public class TitleElementHandler implements IElementHandler, _SafeStr_3491 
    {

        private var _SafeStr_6993:Boolean = false;


        public function initialize(_arg_1:HabboLandingView, _arg_2:_SafeStr_3109, _arg_3:Array, _arg_4:GenericWidget):void
        {
            var _local_5:_SafeStr_3133 = _SafeStr_3133(_arg_2);
            var _local_6:String = _arg_3[1];
            _SafeStr_6993 = ((_arg_3.length > 2) ? (_arg_3[2] == "true") : false);
            _local_5.findChildByName("title_txt").caption = (("${" + _local_6) + "}");
            HabboLandingView.positionAfterAndStretch(_local_5, "title_txt", "hdr_line");
        }

        public function isFloating(_arg_1:Boolean):Boolean
        {
            return ((_arg_1) || (_SafeStr_6993));
        }

        public function refresh():void
        {
        }


    }
}//package com.sulake.habbo.friendbar.landingview.widget.elements

// _SafeStr_3109 = "_-s1L" (String#23, DoABC#4)
// _SafeStr_3133 = "_-U1F" (String#18, DoABC#4)
// _SafeStr_3491 = "_-4A" (String#6633, DoABC#4)
// _SafeStr_6993 = "_-mn" (String#17916, DoABC#4)


