// Decompiled by AS3 Sorcerer 6.30
// www.as3sorcerer.com

//com.sulake.habbo.catalog.viewer.widgets.UserBadgeSelectorCatalogWidget

package com.sulake.habbo.catalog.viewer.widgets
{
    import com.sulake.core.window.components.IItemGridWindow;
    import com.sulake.habbo.catalog.HabboCatalog;
    import com.sulake.core.communication.messages.IMessageEvent;
    import com.sulake.core.window._SafeStr_3133;
    import com.sulake.core.assets.XmlAsset;
    import _-a2._SafeStr_495;
    import com.sulake.habbo.catalog._SafeStr_3141;
    import com.sulake.habbo.catalog.viewer.widgets.events.CatalogWidgetEvent;
    import com.sulake.habbo.catalog.viewer.widgets.events.SelectProductEvent;
    import com.sulake.habbo.window.widgets._SafeStr_3349;
    import com.sulake.core.window.components._SafeStr_3199;
    import com.sulake.core.window.components._SafeStr_3195;
    import com.sulake.habbo.catalog.viewer.widgets.events.SetExtraPurchaseParameterEvent;
    import com.sulake.habbo.catalog.viewer.widgets.events.SetRoomPreviewerStuffDataEvent;
    import com.sulake.core.window.events._SafeStr_3116;
    import com.sulake.core.window._SafeStr_3109;
    import com.sulake.habbo.room.object.data.StringArrayStuffData;
    import com.sulake.habbo.room.IStuffData;

    public class UserBadgeSelectorCatalogWidget extends CatalogWidget implements _SafeStr_3303 
    {

        private static const BADGE_GRID_ITEM_NAME:String = "badgeGridItem";

        private var _itemGrid:IItemGridWindow;
        private var _gridItemLayout:XML;
        private var _catalog:HabboCatalog;
        private var _SafeStr_6684:int = -1;
        private var _SafeStr_6682:IMessageEvent;
        private var _SafeStr_6683:Array;

        public function UserBadgeSelectorCatalogWidget(_arg_1:_SafeStr_3133, _arg_2:HabboCatalog)
        {
            super(_arg_1);
            _catalog = _arg_2;
            _SafeStr_6683 = _catalog.getProperty("badge.display.excluded.badgeCodes").split(",");
        }

        override public function dispose():void
        {
            if (_SafeStr_6682)
            {
                _catalog.connection.removeMessageEvent(_SafeStr_6682);
            };
            _catalog = null;
            _SafeStr_6683 = null;
            super.dispose();
        }

        override public function init():Boolean
        {
            _itemGrid = (_window.findChildByName("badgeGrid") as IItemGridWindow);
            var _local_1:XmlAsset = (page.viewer.catalog.assets.getAssetByName("badgeGridItem") as XmlAsset);
            _gridItemLayout = (_local_1.content as XML);
            resetBadgeSelectorGrid();
            events.addEventListener("WIDGETS_INITIALIZED", onWidgetsInitialized);
            _SafeStr_6682 = new _SafeStr_495(onUserBadgesUpdated);
            _catalog.connection.addMessageEvent(_SafeStr_6682);
            return (true);
        }

        private function resetBadgeSelectorGrid():void
        {
            _itemGrid.destroyGridItems();
            var _local_2:int;
            for each (var _local_1:String in _catalog.inventory.getAllMyBadgeIds(_SafeStr_6683))
            {
                _itemGrid.addGridItem(createGridItem(_local_1, _local_2++));
            };
        }

        private function onWidgetsInitialized(_arg_1:CatalogWidgetEvent):void
        {
            if (page.offers.length == 0)
            {
                return;
            };
            var _local_2:_SafeStr_3141 = page.offers[0];
            events.dispatchEvent(new CatalogWidgetEvent("CWE_EXTRA_PARAM_REQUIRED_FOR_BUY"));
            events.dispatchEvent(new SelectProductEvent(_local_2));
        }

        protected function createGridItem(_arg_1:String, _arg_2:int):_SafeStr_3133
        {
            var _local_4:_SafeStr_3133 = (page.viewer.catalog.windowManager.buildFromXML(_gridItemLayout) as _SafeStr_3133);
            var _local_3:_SafeStr_3349 = _SafeStr_3349(_SafeStr_3199(_local_4.findChildByName("badgeWidget")).widget);
            _local_3.type = "normal";
            _local_3.badgeId = _arg_1;
            _local_4.id = _arg_2;
            _local_4.name = "badgeGridItem";
            _local_4.procedure = badgeGridItemWindowProc;
            return (_local_4);
        }

        private function setBadgeGridItemSelectionBg(_arg_1:int, _arg_2:Boolean):void
        {
            var _local_3:_SafeStr_3133 = _SafeStr_3133(_itemGrid.getGridItemAt(_arg_1));
            if (_local_3 != null)
            {
                _SafeStr_3195(_local_3.findChildByName("bg")).style = ((_arg_2) ? 0 : 2);
            };
        }

        private function getBadgeIdOfGridItem(_arg_1:int):String
        {
            var _local_3:_SafeStr_3133 = _SafeStr_3133(_itemGrid.getGridItemAt(_arg_1));
            var _local_2:_SafeStr_3349 = _SafeStr_3349(_SafeStr_3199(_local_3.findChildByName("badgeWidget")).widget);
            return (_local_2.badgeId);
        }

        private function badgeGridItemWindowProc(_arg_1:_SafeStr_3116, _arg_2:_SafeStr_3109):void
        {
            if (_arg_1.type != "WME_CLICK")
            {
                return;
            };
            if (_arg_2.name == "badgeGridItem")
            {
                if (_SafeStr_6684 != -1)
                {
                    setBadgeGridItemSelectionBg(_SafeStr_6684, false);
                };
                _SafeStr_6684 = _arg_2.id;
                if (_SafeStr_6684 < _catalog.inventory.getAllMyBadgeIds(_SafeStr_6683).length)
                {
                    setBadgeGridItemSelectionBg(_SafeStr_6684, true);
                    events.dispatchEvent(new SetExtraPurchaseParameterEvent(getBadgeIdOfGridItem(_SafeStr_6684)));
                    page.dispatchWidgetEvent(new SetRoomPreviewerStuffDataEvent(getPreviewerStuffData()));
                };
            };
        }

        private function getPreviewerStuffData():IStuffData
        {
            var _local_1:Array = [];
            _local_1.push("0");
            _local_1.push(_catalog.inventory.getAllMyBadgeIds(_SafeStr_6683)[_SafeStr_6684]);
            _local_1.push("");
            _local_1.push("");
            var _local_2:StringArrayStuffData = new StringArrayStuffData();
            _local_2.setArray(_local_1);
            return (_local_2);
        }

        private function onUserBadgesUpdated(_arg_1:IMessageEvent):void
        {
            resetBadgeSelectorGrid();
        }


    }
}//package com.sulake.habbo.catalog.viewer.widgets

// _SafeStr_3109 = "_-s1L" (String#23, DoABC#4)
// _SafeStr_3116 = "_-XC" (String#59, DoABC#4)
// _SafeStr_3133 = "_-U1F" (String#18, DoABC#4)
// _SafeStr_3141 = "_-MT" (String#715, DoABC#4)
// _SafeStr_3195 = "_-b1g" (String#876, DoABC#4)
// _SafeStr_3199 = "_-Z1u" (String#359, DoABC#4)
// _SafeStr_3303 = "_-g1Z" (String#1682, DoABC#4)
// _SafeStr_3349 = "_-c1x" (String#1353, DoABC#4)
// _SafeStr_495 = "_-hc" (String#9010, DoABC#4)
// _SafeStr_6682 = "_-NG" (String#13669, DoABC#4)
// _SafeStr_6683 = "_-Q1o" (String#9977, DoABC#4)
// _SafeStr_6684 = "_-V11" (String#8189, DoABC#4)


