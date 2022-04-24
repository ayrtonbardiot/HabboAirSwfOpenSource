// by nota

//com.sulake.habbo.ui.widget.furniture.highscore.HighScoreDisplayWidget

package com.sulake.habbo.ui.widget.furniture.highscore
{
    import com.sulake.habbo.ui.widget.RoomWidgetBase;
    import com.sulake.core.window._SafeStr_3133;
    import com.sulake.core.window.components._SafeStr_3332;
    import flash.geom.Point;
    import com.sulake.habbo.ui.handler._SafeStr_3313;
    import flash.geom.Rectangle;
    import com.sulake.habbo.ui.IRoomWidgetHandler;
    import com.sulake.habbo.window._SafeStr_1695;
    import com.sulake.core.assets._SafeStr_21;
    import com.sulake.habbo.localization._SafeStr_18;
    import com.sulake.core.window.events._SafeStr_3116;
    import com.sulake.core.window._SafeStr_3109;
    import com.sulake.core.window.components.IItemListWindow;
    import com.sulake.habbo.room.object.data.HighScoreData;
    import com.sulake.habbo.room.object.data._SafeStr_1671;

    public class HighScoreDisplayWidget extends RoomWidgetBase 
    {

        public static const INVALID_ID:int = -1;
        private static const RELATIVE_OFFSET_X:int = -138;
        private static const RELATIVE_OFFSET_Y:int = -400;
        private static const SCORETYPE_ONE_PER_TEAM:int = 0;
        private static const SCORETYPE_AGGREGATED_WINS:int = 1;
        private static const SCORETYPE_ALWAYS_NEW_SCORE:int = 2;
        private static const CLEARTYPE_NEVER:int = 0;
        private static const CLEARTYPE_DAILY:int = 1;
        private static const CLEARTYPE_WEEKLY:int = 2;
        private static const CLEARTYPE_MONTHLY:int = 3;
        private static const SCORETYPE_LOCALIZATION_KEY_POSTFIX:Array = ["perteam", "mostwins", "classic"];
        private static const CLEARTYPE_LOCALIZATION_KEY_POSTFIX:Array = ["alltime", "daily", "weekly", "monthly"];

        private var _rootContainerBackground:_SafeStr_3133;
        private var _bubble:_SafeStr_3332;
        private var _SafeStr_5180:_SafeStr_3133;
        private var _SafeStr_3693:int = -1;
        private var _SafeStr_5181:int = -1;
        private var _lastPosition:Point = new Point(0, 0);

        public function HighScoreDisplayWidget(_arg_1:IRoomWidgetHandler, _arg_2:_SafeStr_1695, _arg_3:_SafeStr_21=null, _arg_4:_SafeStr_18=null)
        {
            super(_arg_1, _arg_2, _arg_3, _arg_4);
            _SafeStr_3313(_arg_1).widget = this;
            _rootContainerBackground = _SafeStr_3133(_arg_2.createWindow("room_widget_highscore_background_container", "", 4, 0, 0, new Rectangle(0, 0, 10, 10)));
            resizeRootContainerToDesktop();
            _rootContainerBackground.addEventListener("WE_PARENT_RESIZED", resizeRootContainerToDesktop);
        }

        private function resizeRootContainerToDesktop(_arg_1:_SafeStr_3116=null):void
        {
            _rootContainerBackground.width = _rootContainerBackground.desktop.width;
            _rootContainerBackground.height = _rootContainerBackground.desktop.height;
        }

        override public function get mainWindow():_SafeStr_3109
        {
            return (_rootContainerBackground);
        }

        override public function dispose():void
        {
            if (_bubble != null)
            {
                destroyWindow();
            };
            _rootContainerBackground.removeEventListener("WE_PARENT_RESIZED", resizeRootContainerToDesktop);
            _rootContainerBackground.dispose();
            super.dispose();
        }

        public function open(_arg_1:int, _arg_2:int, _arg_3:_SafeStr_1671):void
        {
            var _local_4:* = null;
            var _local_8:* = null;
            var _local_6:* = null;
            if (_bubble != null)
            {
                destroyWindow();
            };
            if (((!(_arg_3.clearType == -1)) && (!(_arg_3.scoreType == -1))))
            {
                _local_4 = _SafeStr_3313(_SafeStr_3914).container.localization.getLocalization(("high.score.display.cleartype." + CLEARTYPE_LOCALIZATION_KEY_POSTFIX[_arg_3.clearType]));
                _local_8 = _SafeStr_3313(_SafeStr_3914).container.localization.getLocalization(("high.score.display.scoretype." + SCORETYPE_LOCALIZATION_KEY_POSTFIX[_arg_3.scoreType]));
                _SafeStr_3313(_SafeStr_3914).container.localization.registerParameter("high.score.display.caption", "cleartype", _local_4);
                _SafeStr_3313(_SafeStr_3914).container.localization.registerParameter("high.score.display.caption", "scoretype", _local_8);
            };
            _SafeStr_3693 = _arg_2;
            _SafeStr_5181 = _arg_1;
            createWindow();
            if (!_SafeStr_5180)
            {
                _SafeStr_14.log("ERROR: 'entry_template' could not found from high score display's window XML");
                return;
            };
            var _local_7:IItemListWindow = IItemListWindow(_bubble.findChildByName("entries"));
            for each (var _local_5:HighScoreData in _arg_3.entries)
            {
                _local_6 = _SafeStr_3133(_SafeStr_5180.clone());
                _local_6.getChildByName("usernames").caption = getUserNameList(_local_5.users);
                _local_6.getChildByName("score").caption = _local_5.score.toString();
                _local_7.addListItem(_local_6);
            };
            _local_7.invalidate();
        }

        private function getUserNameList(_arg_1:Array):String
        {
            var _local_2:String = "";
            for each (var _local_3:String in _arg_1)
            {
                _local_2 = ((_local_2 + _local_3) + ", ");
            };
            return (_local_2.substr(0, (_local_2.length - 2)));
        }

        public function setRelativePositionToRoomObjectAt(_arg_1:int, _arg_2:int):void
        {
            if (!_bubble)
            {
                return;
            };
            _bubble.x = (_arg_1 + -138);
            _bubble.y = (_arg_2 + -400);
        }

        private function createWindow():void
        {
            var _local_1:_SafeStr_3332 = _SafeStr_3332(windowManager.buildFromXML(XML(assets.getAssetByName("high_score_display_xml").content)));
            _SafeStr_5180 = _SafeStr_3133(_local_1.findChildByName("entry_template"));
            IItemListWindow(_local_1.findChildByName("entries")).removeListItem(_SafeStr_5180);
            _bubble = _local_1;
            _bubble.x = _lastPosition.x;
            _bubble.y = _lastPosition.y;
            _rootContainerBackground.addChild(_local_1);
        }

        private function destroyWindow():void
        {
            _rootContainerBackground.removeChild(_bubble);
            _lastPosition.x = _bubble.x;
            _lastPosition.y = _bubble.y;
            _bubble.dispose();
            _bubble = null;
            _SafeStr_3693 = -1;
            _SafeStr_5181 = -1;
        }

        public function get isOpen():Boolean
        {
            return ((!(_bubble == null)) && (_bubble.visible));
        }

        public function get roomId():int
        {
            return (_SafeStr_3693);
        }

        public function get roomObjId():int
        {
            return (_SafeStr_5181);
        }

        public function close():void
        {
            destroyWindow();
        }


    }
}//package com.sulake.habbo.ui.widget.furniture.highscore

// _SafeStr_14 = "_-ED" (String#155, DoABC#4)
// _SafeStr_1671 = "_-D1S" (String#18983, DoABC#4)
// _SafeStr_1695 = "_-sN" (String#340, DoABC#4)
// _SafeStr_18 = "_-61x" (String#484, DoABC#4)
// _SafeStr_21 = "_-61a" (String#265, DoABC#4)
// _SafeStr_3109 = "_-s1L" (String#23, DoABC#4)
// _SafeStr_3116 = "_-XC" (String#59, DoABC#4)
// _SafeStr_3133 = "_-U1F" (String#18, DoABC#4)
// _SafeStr_3313 = "_-RQ" (String#7768, DoABC#4)
// _SafeStr_3332 = "_-s1R" (String#3135, DoABC#4)
// _SafeStr_3693 = "_-KI" (String#730, DoABC#4)
// _SafeStr_3914 = "_-w1m" (String#1204, DoABC#4)
// _SafeStr_5180 = "_-324" (String#11962, DoABC#4)
// _SafeStr_5181 = "_-3F" (String#13506, DoABC#4)


