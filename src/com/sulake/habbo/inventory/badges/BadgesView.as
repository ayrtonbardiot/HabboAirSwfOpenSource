// by nota

//com.sulake.habbo.inventory.badges.BadgesView

package com.sulake.habbo.inventory.badges
{
    import com.sulake.habbo.inventory.IInventoryView;
    import com.sulake.habbo.window._SafeStr_1695;
    import com.sulake.core.window._SafeStr_3133;
    import com.sulake.core.window.components.IItemGridWindow;
    import com.sulake.core.assets.IAssetLibrary;
    import com.sulake.core.window.components._SafeStr_3122;
    import com.sulake.habbo.window.widgets._SafeStr_3349;
    import com.sulake.core.window.components._SafeStr_3199;
    import com.sulake.core.window._SafeStr_3109;
    import com.sulake.core.window.components.IItemListWindow;
    import __AS3__.vec.Vector;
    import com.sulake.core.window.components.ITextWindow;
    import com.sulake.core.window.events.WindowKeyboardEvent;
    import com.sulake.core.window.events._SafeStr_3116;

    public class BadgesView implements IInventoryView 
    {

        private static const GRID_UPDATE_DELAY_MS:int = 100;
        private static const GRID_ITEMS_PER_UPDATE:int = 25;

        private var _windowManager:_SafeStr_1695;
        private var _SafeStr_3882:_SafeStr_3133;
        private var _SafeStr_4619:BadgesModel;
        private var _SafeStr_6475:IItemGridWindow;
        private var _disposed:Boolean = false;
        private var _SafeStr_3883:Boolean = false;
        private var _SafeStr_5384:BadgeGridView;

        public function BadgesView(_arg_1:BadgesModel, _arg_2:_SafeStr_1695, _arg_3:IAssetLibrary)
        {
            _SafeStr_4619 = _arg_1;
            _windowManager = _arg_2;
        }

        public function get disposed():Boolean
        {
            return (_disposed);
        }

        public function get isVisible():Boolean
        {
            return (((_SafeStr_3882) && (!(_SafeStr_3882.parent == null))) && (_SafeStr_3882.visible));
        }

        public function dispose():void
        {
            if (_disposed)
            {
                return;
            };
            _disposed = true;
            _windowManager = null;
            _SafeStr_4619 = null;
            if (_SafeStr_5384 != null)
            {
                _SafeStr_5384.dispose();
                _SafeStr_5384 = null;
            };
            _SafeStr_6475 = null;
            if (_SafeStr_3882)
            {
                _SafeStr_3882.dispose();
                _SafeStr_3882 = null;
            };
        }

        public function getWindowContainer():_SafeStr_3133
        {
            if (!_SafeStr_3883)
            {
                init();
            };
            if (((_SafeStr_3882 == null) || (_SafeStr_3882.disposed)))
            {
                return (null);
            };
            return (_SafeStr_3882);
        }

        public function updateAll(_arg_1:String):void
        {
            updateListViews(_arg_1);
            updateActionView();
        }

        public function updateActionView():void
        {
            var _local_2:*;
            if (!_SafeStr_3883)
            {
                return;
            };
            if (((_SafeStr_3882 == null) || (_SafeStr_3882.disposed)))
            {
                return;
            };
            var _local_3:_SafeStr_3122 = (_SafeStr_3882.findChildByName("wearBadge_button") as _SafeStr_3122);
            if (_local_3 == null)
            {
                return;
            };
            var _local_1:Badge = _SafeStr_4619.getSelectedBadge();
            if (_local_1 == null)
            {
                _local_3.disable();
                setBadgeName(null);
                _SafeStr_3882.findChildByName("badge_image").visible = false;
            }
            else
            {
                if (_local_1.isInUse)
                {
                    _local_3.caption = "${inventory.badges.clearbadge}";
                }
                else
                {
                    _local_3.caption = "${inventory.badges.wearbadge}";
                };
                setBadgeName(_local_1.badgeName);
                _SafeStr_3349(_SafeStr_3199(_SafeStr_3882.findChildByName("badge_image")).widget).badgeId = _local_1.badgeId;
                _SafeStr_3882.findChildByName("badge_image").visible = true;
                _local_2 = _SafeStr_4619.getBadges(1);
                if ((((!(_local_2 == null)) && (_local_2.length >= _SafeStr_4619.getMaxActiveCount())) && (!(_local_1.isInUse))))
                {
                    _local_3.disable();
                }
                else
                {
                    _local_3.enable();
                };
            };
        }

        private function init():void
        {
            _SafeStr_3882 = _SafeStr_4619.controller.view.getView("badges");
            _SafeStr_3882.procedure = windowEventProc;
            _SafeStr_3882.visible = false;
            var _local_3:_SafeStr_3109 = _SafeStr_3882.findChildByName("wearBadge_button");
            if (_local_3 != null)
            {
                _local_3.addEventListener("WME_CLICK", onWearBadgeClick);
            };
            var _local_1:IItemGridWindow = (_SafeStr_3882.findChildByName("inactive_items") as IItemGridWindow);
            var _local_2:IItemListWindow = (_SafeStr_3882.findChildByName("item_grid_pages") as IItemListWindow);
            _SafeStr_5384 = new BadgeGridView(this, _local_1, _local_2);
            _SafeStr_6475 = (_SafeStr_3882.findChildByName("active_items") as IItemGridWindow);
            _SafeStr_3882.findChildByName("filter").caption = "";
            _SafeStr_3882.findChildByName("clear_filter_button").visible = false;
            _SafeStr_3883 = true;
        }

        private function updateListViews(_arg_1:String):void
        {
            var _local_2:* = null;
            var _local_3:int;
            if (!_SafeStr_3883)
            {
                return;
            };
            if (((_SafeStr_3882 == null) || (_SafeStr_3882.disposed)))
            {
                return;
            };
            _SafeStr_6475.removeGridItems();
            _SafeStr_5384.setFilter(0, _arg_1, _arg_1);
            _SafeStr_5384.setItems(_SafeStr_4619.getBadges(0));
            var _local_4:Vector.<Badge> = _SafeStr_4619.getBadges(1);
            _local_3 = 0;
            while (_local_3 < _local_4.length)
            {
                _local_2 = (_local_4[_local_3] as Badge);
                _SafeStr_6475.addGridItem(_local_2.window);
                _local_3++;
            };
        }

        private function setBadgeName(_arg_1:String):void
        {
            if (((_SafeStr_3882 == null) || (_SafeStr_3882.disposed)))
            {
                return;
            };
            var _local_2:ITextWindow = (_SafeStr_3882.findChildByName("badgeName") as ITextWindow);
            if (_local_2 == null)
            {
                return;
            };
            if (_arg_1 == null)
            {
                _local_2.text = "";
            }
            else
            {
                _local_2.text = "";
                _local_2.text = _arg_1;
            };
        }

        private function windowEventProc(_arg_1:_SafeStr_3116, _arg_2:_SafeStr_3109):void
        {
            var _local_3:* = null;
            if (_arg_1.type == "WME_CLICK")
            {
                switch (_arg_2.name)
                {
                    case "clear_filter_button":
                        _SafeStr_3882.findChildByName("filter").caption = "";
                        _arg_2.visible = false;
                        updateAll(null);
                };
            }
            else
            {
                if (_arg_1.type == "WKE_KEY_UP")
                {
                    _local_3 = (_arg_1 as WindowKeyboardEvent);
                    switch (_arg_2.name)
                    {
                        case "filter":
                            _SafeStr_3882.findChildByName("clear_filter_button").visible = (_arg_2.caption.length > 0);
                            if (_local_3.keyCode == 13)
                            {
                                updateAll(_arg_2.caption);
                            };
                            return;
                    };
                };
            };
        }

        private function onWearBadgeClick(_arg_1:_SafeStr_3116):void
        {
            var _local_2:Badge = _SafeStr_4619.getSelectedBadge();
            if (_local_2 != null)
            {
                _SafeStr_4619.toggleBadgeWearing(_local_2.badgeId);
            };
        }


    }
}//package com.sulake.habbo.inventory.badges

// _SafeStr_1695 = "_-sN" (String#340, DoABC#4)
// _SafeStr_21 = "_-61a" (String#265, DoABC#4)
// _SafeStr_3109 = "_-s1L" (String#23, DoABC#4)
// _SafeStr_3116 = "_-XC" (String#59, DoABC#4)
// _SafeStr_3122 = "_-i1L" (String#666, DoABC#4)
// _SafeStr_3133 = "_-U1F" (String#18, DoABC#4)
// _SafeStr_3199 = "_-Z1u" (String#359, DoABC#4)
// _SafeStr_3349 = "_-c1x" (String#1353, DoABC#4)
// _SafeStr_3882 = "_-D10" (String#53, DoABC#4)
// _SafeStr_3883 = "_-w1c" (String#683, DoABC#4)
// _SafeStr_4619 = "_-x1i" (String#278, DoABC#4)
// _SafeStr_5384 = "_-Ng" (String#1406, DoABC#4)
// _SafeStr_6475 = "_-s17" (String#10358, DoABC#4)


