// by nota

//com.sulake.habbo.friendbar.landingview.widget.SafetyQuizPromoWidget

package com.sulake.habbo.friendbar.landingview.widget
{
    import com.sulake.habbo.friendbar.landingview.interfaces.ILandingViewWidget;
    import com.sulake.habbo.friendbar.landingview.HabboLandingView;
    import com.sulake.core.window._SafeStr_3133;
    import com.sulake.core.window.events._SafeStr_3116;
    import com.sulake.core.window._SafeStr_3109;
    import com.sulake.habbo.window.widgets._SafeStr_3289;
    import com.sulake.core.window.components._SafeStr_3199;

    public class SafetyQuizPromoWidget implements ILandingViewWidget 
    {

        private var _landingView:HabboLandingView;
        private var _container:_SafeStr_3133;
        private var _disposed:Boolean;

        public function SafetyQuizPromoWidget(_arg_1:HabboLandingView)
        {
            _landingView = _arg_1;
        }

        public function initialize():void
        {
            _container = _SafeStr_3133(_landingView.getXmlWindow("safety_quiz_promo"));
            _container.procedure = widgetProcedure;
            refresh();
        }

        private function widgetProcedure(_arg_1:_SafeStr_3116, _arg_2:_SafeStr_3109):void
        {
            if (((_arg_1.type == "WME_CLICK") && (_arg_2.name == "safety_quiz_button")))
            {
                _landingView.habboHelp.showSafetyBooklet();
            };
        }

        public function refresh():void
        {
            if (((!(_container == null)) && (!(_container.disposed))))
            {
                _SafeStr_3289(_SafeStr_3199(_container.findChildByName("avatar")).widget).figure = _landingView.sessionDataManager.figure;
            };
        }

        public function get container():_SafeStr_3109
        {
            return (_container);
        }

        public function dispose():void
        {
            if (!_disposed)
            {
                if (_container != null)
                {
                    _container.dispose();
                    _container = null;
                };
                _landingView = null;
                _disposed = true;
            };
        }

        public function get disposed():Boolean
        {
            return (_disposed);
        }


    }
}//package com.sulake.habbo.friendbar.landingview.widget

// _SafeStr_3109 = "_-s1L" (String#23, DoABC#4)
// _SafeStr_3116 = "_-XC" (String#59, DoABC#4)
// _SafeStr_3133 = "_-U1F" (String#18, DoABC#4)
// _SafeStr_3199 = "_-Z1u" (String#359, DoABC#4)
// _SafeStr_3289 = "_-O18" (String#2042, DoABC#4)


