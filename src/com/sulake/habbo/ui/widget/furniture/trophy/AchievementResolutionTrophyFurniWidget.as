// by nota

//com.sulake.habbo.ui.widget.furniture.trophy.AchievementResolutionTrophyFurniWidget

package com.sulake.habbo.ui.widget.furniture.trophy
{
    import com.sulake.habbo.ui.widget.RoomWidgetBase;
    import com.sulake.core.runtime._SafeStr_19;
    import com.sulake.habbo.ui.IRoomWidgetHandler;
    import com.sulake.habbo.window._SafeStr_1695;
    import com.sulake.core.assets.IAssetLibrary;
    import com.sulake.habbo.localization._SafeStr_18;
    import flash.events.IEventDispatcher;
    import com.sulake.habbo.ui.widget.events.RoomWidgetAchievementResolutionTrophyDataUpdateEvent;

    public class AchievementResolutionTrophyFurniWidget extends RoomWidgetBase implements ITrophyFurniWidget 
    {

        private var _name:String;
        private var _SafeStr_4810:String;
        private var _SafeStr_4132:String;
        private var _color:int;
        private var _configuration:_SafeStr_19;
        private var _SafeStr_3882:ITrophyView;
        private var _SafeStr_4811:int;

        public function AchievementResolutionTrophyFurniWidget(_arg_1:IRoomWidgetHandler, _arg_2:_SafeStr_1695, _arg_3:IAssetLibrary, _arg_4:_SafeStr_18, _arg_5:_SafeStr_19)
        {
            super(_arg_1, _arg_2, _arg_3, _arg_4);
            _configuration = _arg_5;
        }

        public function get name():String
        {
            return (_name);
        }

        public function get date():String
        {
            return (_SafeStr_4810);
        }

        public function get message():String
        {
            return (_SafeStr_4132);
        }

        public function get color():int
        {
            return (_color);
        }

        public function get configuration():_SafeStr_19
        {
            return (_configuration);
        }

        override public function dispose():void
        {
            if (_SafeStr_3882)
            {
                _SafeStr_3882.dispose();
                _SafeStr_3882 = null;
            };
            _configuration = null;
            super.dispose();
        }

        override public function registerUpdateEvents(_arg_1:IEventDispatcher):void
        {
            if (_arg_1 == null)
            {
                return;
            };
            _arg_1.addEventListener("RWARTDUE_TROPHY_DATA", onObjectUpdate);
            super.registerUpdateEvents(_arg_1);
        }

        override public function unregisterUpdateEvents(_arg_1:IEventDispatcher):void
        {
            if (_arg_1 == null)
            {
                return;
            };
            _arg_1.removeEventListener("RWARTDUE_TROPHY_DATA", onObjectUpdate);
        }

        private function onObjectUpdate(_arg_1:RoomWidgetAchievementResolutionTrophyDataUpdateEvent):void
        {
            _name = _arg_1.name;
            _SafeStr_4810 = _arg_1.date;
            _SafeStr_4132 = _arg_1.message;
            _color = (_arg_1.color - 1);
            _SafeStr_4811 = _arg_1.viewType;
            if (((_color < 0) || (_color > 2)))
            {
                _color = 0;
            };
            updateInterface();
        }

        private function updateInterface():void
        {
            if (_SafeStr_3882 != null)
            {
                _SafeStr_3882.dispose();
            };
            var _local_1:* = _SafeStr_4811;
            _SafeStr_3882 = new TrophyView(this);
            _SafeStr_3882.showInterface();
        }


    }
}//package com.sulake.habbo.ui.widget.furniture.trophy

// _SafeStr_1695 = "_-sN" (String#340, DoABC#4)
// _SafeStr_18 = "_-61x" (String#484, DoABC#4)
// _SafeStr_19 = "_-01r" (String#1323, DoABC#4)
// _SafeStr_21 = "_-61a" (String#265, DoABC#4)
// _SafeStr_3882 = "_-D10" (String#53, DoABC#4)
// _SafeStr_4132 = "_-s1S" (String#1283, DoABC#4)
// _SafeStr_4810 = "_-zn" (String#3201, DoABC#4)
// _SafeStr_4811 = "_-r1b" (String#3566, DoABC#4)


