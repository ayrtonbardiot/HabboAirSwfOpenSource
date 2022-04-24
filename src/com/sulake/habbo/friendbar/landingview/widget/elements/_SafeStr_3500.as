// by nota

//com.sulake.habbo.friendbar.landingview.widget.elements._SafeStr_3500

package com.sulake.habbo.friendbar.landingview.widget.elements
{
    import com.sulake.habbo.friendbar.landingview.interfaces.elements.IElementHandler;
    import com.sulake.core.runtime._SafeStr_13;
    import com.sulake.habbo.friendbar.landingview.HabboLandingView;
    import com.sulake.core.window._SafeStr_3133;
    import com.sulake.core.window._SafeStr_3109;
    import com.sulake.habbo.friendbar.landingview.widget.GenericWidget;
    import com.sulake.habbo.utils.HabboWebTools;
    import com.sulake.core.window.events._SafeStr_3116;

    public class _SafeStr_3500 implements IElementHandler, _SafeStr_13 
    {

        private var _landingView:HabboLandingView;
        private var _SafeStr_5275:String;


        public function dispose():void
        {
            _landingView = null;
        }

        public function get disposed():Boolean
        {
            return (_landingView == null);
        }

        public function initialize(_arg_1:HabboLandingView, _arg_2:_SafeStr_3109, _arg_3:Array, _arg_4:GenericWidget):void
        {
            _landingView = _arg_1;
            var _local_5:String = _arg_3[1];
            _SafeStr_5275 = _arg_3[2];
            _arg_2.procedure = onLink;
            _SafeStr_3133(_arg_2).findChildByName("link_txt").caption = (("${" + _local_5) + "}");
        }

        private function onLink(_arg_1:_SafeStr_3116, _arg_2:_SafeStr_3109):void
        {
            if (_arg_1.type == "WME_CLICK")
            {
                _landingView.windowManager.alert("${catalog.alert.external.link.title}", "${catalog.alert.external.link.desc}", 0, null);
                HabboWebTools.openWebPage(_SafeStr_5275);
                _landingView.tracking.trackGoogle("landingView", "click_link");
            };
        }

        public function refresh():void
        {
        }


    }
}//package com.sulake.habbo.friendbar.landingview.widget.elements

// _SafeStr_13 = "_-P1N" (String#326, DoABC#4)
// _SafeStr_3109 = "_-s1L" (String#23, DoABC#4)
// _SafeStr_3116 = "_-XC" (String#59, DoABC#4)
// _SafeStr_3133 = "_-U1F" (String#18, DoABC#4)
// _SafeStr_3500 = "_-3e" (String#15010, DoABC#4)
// _SafeStr_5275 = "_-J1N" (String#2314, DoABC#4)


