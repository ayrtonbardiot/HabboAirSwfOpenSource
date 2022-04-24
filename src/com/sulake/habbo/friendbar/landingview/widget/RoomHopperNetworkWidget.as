// by nota

//com.sulake.habbo.friendbar.landingview.widget.RoomHopperNetworkWidget

package com.sulake.habbo.friendbar.landingview.widget
{
    import com.sulake.habbo.friendbar.landingview.interfaces.ILandingViewWidget;
    import com.sulake.habbo.friendbar.landingview.interfaces.ISettingsAwareWidget;
    import com.sulake.habbo.friendbar.landingview.HabboLandingView;
    import com.sulake.core.window._SafeStr_3133;
    import com.sulake.core.window.components.IStaticBitmapWrapperWindow;
    import com.sulake.core.window._SafeStr_3109;
    import com.sulake.habbo.friendbar.landingview.layout.WidgetContainerLayout;
    import com.sulake.habbo.friendbar.landingview.layout.CommonWidgetSettings;
    import com.sulake.core.window.events._SafeStr_3116;

    public class RoomHopperNetworkWidget implements ILandingViewWidget, ISettingsAwareWidget 
    {

        private var _landingView:HabboLandingView;
        private var _container:_SafeStr_3133;
        private var _disposed:Boolean = false;
        private var _SafeStr_6963:int;
        private var _SafeStr_6962:Array = [];

        public function RoomHopperNetworkWidget(_arg_1:HabboLandingView)
        {
            _landingView = _arg_1;
            _SafeStr_6962.push("title");
            _SafeStr_6962.push("header");
            _SafeStr_6962.push("info");
        }

        protected static function get xmlAssetName():String
        {
            return ("room_hopper_network");
        }


        public function initialize():void
        {
            _container = _SafeStr_3133(_landingView.getXmlWindow(xmlAssetName));
            _SafeStr_6963 = _landingView.getInteger("landing.view.roomhopper.network.id", 0);
            var _local_1:IStaticBitmapWrapperWindow = IStaticBitmapWrapperWindow(_container.findChildByName("bitmap"));
            _local_1.assetUri = _landingView.getProperty("landing.view.roomhopper.image.uri");
            _container.findChildByName("button").procedure = onRoomForwardButton;
        }

        public function refresh():void
        {
        }

        public function get container():_SafeStr_3109
        {
            return (_container);
        }

        public function dispose():void
        {
            if (!disposed)
            {
                if (_container)
                {
                    _container.dispose();
                    _container = null;
                };
                _disposed = true;
            };
        }

        public function get disposed():Boolean
        {
            return (_disposed);
        }

        public function set settings(_arg_1:CommonWidgetSettings):void
        {
            WidgetContainerLayout.applyCommonWidgetSettings(_container, _arg_1);
        }

        private function onRoomForwardButton(_arg_1:_SafeStr_3116, _arg_2:_SafeStr_3109):void
        {
            if (_arg_1.type == "WME_CLICK")
            {
                _landingView.navigator.goToRoomNetwork(_SafeStr_6963, false);
            };
        }


    }
}//package com.sulake.habbo.friendbar.landingview.widget

// _SafeStr_3109 = "_-s1L" (String#23, DoABC#4)
// _SafeStr_3116 = "_-XC" (String#59, DoABC#4)
// _SafeStr_3133 = "_-U1F" (String#18, DoABC#4)
// _SafeStr_6962 = "_-NU" (String#13525, DoABC#4)
// _SafeStr_6963 = "_-si" (String#18475, DoABC#4)


