// by nota

//com.sulake.habbo.friendbar.landingview.widget.HabboModerationPromoWidget

package com.sulake.habbo.friendbar.landingview.widget
{
    import com.sulake.habbo.friendbar.landingview.interfaces.ILandingViewWidget;
    import com.sulake.habbo.friendbar.landingview.HabboLandingView;
    import com.sulake.core.window._SafeStr_3133;
    import com.sulake.core.window._SafeStr_3109;

    public class HabboModerationPromoWidget implements ILandingViewWidget 
    {

        private var _landingView:HabboLandingView;
        private var _container:_SafeStr_3133;

        public function HabboModerationPromoWidget(_arg_1:HabboLandingView)
        {
            _landingView = _arg_1;
        }

        public function get container():_SafeStr_3109
        {
            return (_container);
        }

        public function dispose():void
        {
            _landingView = null;
            _container = null;
        }

        public function initialize():void
        {
            _container = _SafeStr_3133(_landingView.getXmlWindow("habbo_moderation_promo"));
            HabboLandingView.positionAfterAndStretch(_container, "title_txt", "hdr_line");
        }

        public function refresh():void
        {
        }

        public function get disposed():Boolean
        {
            return (_landingView == null);
        }


    }
}//package com.sulake.habbo.friendbar.landingview.widget

// _SafeStr_3109 = "_-s1L" (String#23, DoABC#4)
// _SafeStr_3133 = "_-U1F" (String#18, DoABC#4)


