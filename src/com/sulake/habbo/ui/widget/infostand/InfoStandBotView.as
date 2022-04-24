// by nota

//com.sulake.habbo.ui.widget.infostand.InfoStandBotView

package com.sulake.habbo.ui.widget.infostand
{
    import com.sulake.core.window.components.IItemListWindow;
    import com.sulake.core.window.components._SafeStr_3195;
    import com.sulake.core.window._SafeStr_3109;
    import com.sulake.core.window.components.ITextWindow;
    import flash.geom.Rectangle;
    import com.sulake.core.window.events.WindowMouseEvent;
    import com.sulake.core.assets.XmlAsset;
    import com.sulake.core.window.components._SafeStr_3199;
    import com.sulake.habbo.window.widgets._SafeStr_3289;
    import com.sulake.core.window._SafeStr_3133;
    import com.sulake.habbo.window.widgets._SafeStr_3349;
    import com.sulake.habbo.ui.widget.events.RoomWidgetUserInfoUpdateEvent;

    public class InfoStandBotView 
    {

        private const ITEM_SPACER:int = 5;
        private const MOTTO_TEXT_OFFSET:int = 3;
        private const MAX_MOTTO_HEIGHT:int = 50;
        private const MIN_MOTTO_HEIGHT:int = 23;

        private var _SafeStr_4981:InfoStandWidget;
        private var _window:IItemListWindow;
        private var _SafeStr_5485:IItemListWindow;
        private var _SafeStr_5484:_SafeStr_3195;
        private var _badgeDetails:_SafeStr_3195;

        public function InfoStandBotView(_arg_1:InfoStandWidget, _arg_2:String)
        {
            _SafeStr_4981 = _arg_1;
            createWindow(_arg_2);
        }

        public function dispose():void
        {
            _SafeStr_4981 = null;
            _window.dispose();
            _window = null;
            disposeBadgeDetails();
        }

        public function get window():IItemListWindow
        {
            return (_window);
        }

        private function updateWindow():void
        {
            if (((_SafeStr_5485 == null) || (_SafeStr_5484 == null)))
            {
                return;
            };
            _SafeStr_5485.height = _SafeStr_5485.scrollableRegion.height;
            _SafeStr_5484.height = (_SafeStr_5485.height + 20);
            _window.width = _SafeStr_5484.width;
            _window.height = _window.scrollableRegion.height;
            _SafeStr_4981.refreshContainer();
        }

        private function createWindow(_arg_1:String):void
        {
            var _local_2:* = null;
            var _local_4:int;
            _window = (_SafeStr_4981.getXmlWindow("bot_view") as IItemListWindow);
            if (_window == null)
            {
                throw (new Error("Failed to construct window from XML!"));
            };
            _SafeStr_5484 = (_window.getListItemByName("info_border") as _SafeStr_3195);
            _SafeStr_5485 = (_SafeStr_5484.findChildByName("infostand_element_list") as IItemListWindow);
            if (_SafeStr_5484 != null)
            {
                _SafeStr_5485 = (_SafeStr_5484.findChildByName("infostand_element_list") as IItemListWindow);
            };
            _window.name = _arg_1;
            _SafeStr_4981.mainContainer.addChild(_window);
            var _local_3:_SafeStr_3109 = _SafeStr_5484.findChildByTag("close");
            if (_local_3 != null)
            {
                _local_3.addEventListener("WME_CLICK", onClose);
            };
            _local_4 = 0;
            while (_local_4 < 5)
            {
                _local_2 = _SafeStr_5484.findChildByName(("badge_" + _local_4));
                if (_local_2 != null)
                {
                    _local_2.addEventListener("WME_OVER", showBadgeInfo);
                    _local_2.addEventListener("WME_OUT", hideBadgeInfo);
                };
                _local_4++;
            };
        }

        private function showBadgeInfo(_arg_1:WindowMouseEvent):void
        {
            var _local_5:* = null;
            if (_arg_1.window == null)
            {
                return;
            };
            var _local_6:int = _arg_1.window.name.replace("badge_", "");
            if (_local_6 < 0)
            {
                return;
            };
            var _local_2:Array = _SafeStr_4981.userData.badges;
            if (_local_2 == null)
            {
                return;
            };
            if (_local_6 >= _local_2.length)
            {
                return;
            };
            var _local_3:String = _SafeStr_4981.userData.badges[_local_6];
            if (_local_3 == null)
            {
                return;
            };
            createBadgeDetails();
            _local_5 = (_badgeDetails.getChildByName("name") as ITextWindow);
            if (_local_5 != null)
            {
                _local_5.text = _SafeStr_4981.localizations.getBadgeName(_local_3);
            };
            _local_5 = (_badgeDetails.getChildByName("description") as ITextWindow);
            if (_local_5 != null)
            {
                _local_5.text = _SafeStr_4981.localizations.getBadgeDesc(_local_3);
                _badgeDetails.height = ((_local_5.text == "") ? 40 : 99);
            };
            var _local_4:Rectangle = new Rectangle();
            _arg_1.window.getGlobalRectangle(_local_4);
            _badgeDetails.x = (_local_4.left - _badgeDetails.width);
            _badgeDetails.y = (_local_4.top + ((_local_4.height - _badgeDetails.height) / 2));
        }

        private function hideBadgeInfo(_arg_1:WindowMouseEvent):void
        {
            disposeBadgeDetails();
        }

        private function createBadgeDetails():void
        {
            if (_badgeDetails != null)
            {
                return;
            };
            var _local_1:XmlAsset = (_SafeStr_4981.assets.getAssetByName("badge_details") as XmlAsset);
            if (_local_1 == null)
            {
                return;
            };
            _badgeDetails = (_SafeStr_4981.windowManager.buildFromXML((_local_1.content as XML)) as _SafeStr_3195);
            if (_badgeDetails == null)
            {
                throw (new Error("Failed to construct window from XML!"));
            };
        }

        private function disposeBadgeDetails():void
        {
            if (_badgeDetails != null)
            {
                _badgeDetails.dispose();
                _badgeDetails = null;
            };
        }

        private function onClose(_arg_1:WindowMouseEvent):void
        {
            _SafeStr_4981.close();
        }

        public function setFigure(_arg_1:String):void
        {
            var _local_2:_SafeStr_3289 = (_SafeStr_3199(_SafeStr_5484.findChildByName("avatar_image")).widget as _SafeStr_3289);
            _local_2.figure = _arg_1;
        }

        public function set name(_arg_1:String):void
        {
            var _local_2:ITextWindow = (_SafeStr_5485.getListItemByName("name_text") as ITextWindow);
            if (_local_2 == null)
            {
                return;
            };
            _local_2.text = _arg_1;
            _local_2.visible = true;
        }

        public function setMotto(_arg_1:String):void
        {
            var _local_4:_SafeStr_3133 = (_SafeStr_5485.getListItemByName("motto_container") as _SafeStr_3133);
            if (!_local_4)
            {
                return;
            };
            var _local_3:ITextWindow = (_local_4.findChildByName("motto_text") as ITextWindow);
            var _local_2:_SafeStr_3133 = (_SafeStr_5485.getListItemByName("motto_spacer") as _SafeStr_3133);
            if (((_local_3 == null) || (_local_2 == null)))
            {
                return;
            };
            if (_arg_1 == null)
            {
                _arg_1 = "";
            };
            _local_3.text = _arg_1;
            _local_3.height = Math.min((_local_3.textHeight + 5), 50);
            _local_3.height = Math.max(_local_3.height, 23);
            _local_4.height = (_local_3.height + 3);
            updateWindow();
        }

        public function set achievementScore(_arg_1:int):void
        {
            if (!_SafeStr_4981.handler.isActivityDisplayEnabled)
            {
                return;
            };
            var _local_2:ITextWindow = (_SafeStr_5485.getListItemByName("score_value") as ITextWindow);
            if (_local_2 == null)
            {
                return;
            };
            _local_2.text = String(_arg_1);
        }

        public function set carryItem(_arg_1:int):void
        {
            var _local_2:* = null;
            var _local_6:ITextWindow = (_SafeStr_5485.getListItemByName("handitem_txt") as ITextWindow);
            var _local_3:_SafeStr_3133 = (_SafeStr_5485.getListItemByName("handitem_spacer") as _SafeStr_3133);
            if (((_local_6 == null) || (_local_3 == null)))
            {
                return;
            };
            if (((_arg_1 > 0) && (_arg_1 < 999999)))
            {
                _local_2 = _SafeStr_4981.localizations.getLocalization(("handitem" + _arg_1), ("handitem" + _arg_1));
                _SafeStr_4981.localizations.registerParameter("infostand.text.handitem", "item", _local_2);
            };
            _local_6.height = (_local_6.textHeight + 5);
            var _local_4:Boolean = _local_6.visible;
            var _local_5:Boolean = ((_arg_1 > 0) && (_arg_1 < 999999));
            _local_6.visible = _local_5;
            _local_3.visible = _local_5;
            if (_local_5 != _local_4)
            {
                _SafeStr_5485.arrangeListItems();
            };
            updateWindow();
        }

        public function setBadge(_arg_1:int, _arg_2:String):void
        {
            var _local_3:_SafeStr_3349 = (_SafeStr_3199(_SafeStr_5484.findChildByName(("badge_" + _arg_1))).widget as _SafeStr_3349);
            _local_3.badgeId = _arg_2;
        }

        public function clearBadges():void
        {
            var _local_2:int;
            var _local_1:* = null;
            _local_2 = 0;
            while (_local_2 < 5)
            {
                _local_1 = (_SafeStr_3199(_SafeStr_5484.findChildByName(("badge_" + _local_2))).widget as _SafeStr_3349);
                _local_1.badgeId = "";
                _local_2++;
            };
        }

        public function update(_arg_1:RoomWidgetUserInfoUpdateEvent):void
        {
            clearBadges();
            updateInfo(_arg_1);
        }

        private function updateInfo(_arg_1:RoomWidgetUserInfoUpdateEvent):void
        {
            name = _arg_1.name;
            setMotto(_arg_1.motto);
            achievementScore = _arg_1.achievementScore;
            carryItem = _arg_1.carryItem;
            setFigure(_arg_1.figure);
            updateBadges(_arg_1.badges);
        }

        private function updateBadges(_arg_1:Array):void
        {
            var _local_2:int;
            if (_arg_1 == null)
            {
                return;
            };
            _local_2 = 0;
            while (_local_2 < _arg_1.length)
            {
                setBadge(_local_2, _arg_1[_local_2]);
                _local_2++;
            };
        }


    }
}//package com.sulake.habbo.ui.widget.infostand

// _SafeStr_3109 = "_-s1L" (String#23, DoABC#4)
// _SafeStr_3133 = "_-U1F" (String#18, DoABC#4)
// _SafeStr_3195 = "_-b1g" (String#876, DoABC#4)
// _SafeStr_3199 = "_-Z1u" (String#359, DoABC#4)
// _SafeStr_3289 = "_-O18" (String#2042, DoABC#4)
// _SafeStr_3349 = "_-c1x" (String#1353, DoABC#4)
// _SafeStr_4981 = "_-o1H" (String#37, DoABC#4)
// _SafeStr_5484 = "_-d1w" (String#599, DoABC#4)
// _SafeStr_5485 = "_-FZ" (String#843, DoABC#4)


