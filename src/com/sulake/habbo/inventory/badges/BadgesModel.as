// Decompiled by AS3 Sorcerer 6.30
// www.as3sorcerer.com

//com.sulake.habbo.inventory.badges.BadgesModel

package com.sulake.habbo.inventory.badges
{
    import com.sulake.habbo.inventory.IInventoryModel;
    import com.sulake.habbo.inventory.HabboInventory;
    import __AS3__.vec.Vector;
    import com.sulake.core.utils._SafeStr_24;
    import com.sulake.core.assets._SafeStr_21;
    import com.sulake.habbo.communication._SafeStr_25;
    import com.sulake.habbo.window._SafeStr_1695;
    import com.sulake.core.assets.IAsset;
    import com.sulake.core.assets.XmlAsset;
    import com.sulake.core.window._SafeStr_3133;
    import _-i1z._SafeStr_600;
    import _-i1z._SafeStr_1028;
    import flash.events.Event;

    public class BadgesModel implements IInventoryModel 
    {

        public static const BADGES_ALL:int = -1;
        public static const BADGES_INACTIVE:int = 0;
        public static const BADGES_ACTIVE:int = 1;

        private const MAX_ACTIVE_BADGE_COUNT:int = 5;

        private var _SafeStr_4360:HabboInventory;
        private var _SafeStr_3882:BadgesView;
        private var _SafeStr_4145:Vector.<Badge>;
        private var _SafeStr_5029:Vector.<Badge>;
        private var _SafeStr_5028:_SafeStr_24;
        private var _assets:_SafeStr_21;
        private var _communication:_SafeStr_25;
        private var _windowManager:_SafeStr_1695;
        private var _disposed:Boolean = false;

        public function BadgesModel(_arg_1:HabboInventory, _arg_2:_SafeStr_1695, _arg_3:_SafeStr_25, _arg_4:_SafeStr_21)
        {
            _SafeStr_4360 = _arg_1;
            _windowManager = _arg_2;
            _SafeStr_4145 = new Vector.<Badge>(0);
            _SafeStr_5029 = new Vector.<Badge>(0);
            _assets = _arg_4;
            _communication = _arg_3;
            _SafeStr_3882 = new BadgesView(this, _arg_2, _arg_4);
            _SafeStr_5028 = new _SafeStr_24();
            initBadgeWindowAsset();
        }

        public function get disposed():Boolean
        {
            return (_disposed);
        }

        private function initBadgeWindowAsset():void
        {
            var _local_2:IAsset = _assets.getAssetByName("inventory_thumb_xml");
            var _local_1:XmlAsset = XmlAsset(_local_2);
            if (Badge._SafeStr_4618 == null)
            {
                Badge._SafeStr_4618 = (_windowManager.buildFromXML(XML(_local_1.content)) as _SafeStr_3133);
            };
        }

        public function dispose():void
        {
            if (_disposed)
            {
                return;
            };
            if (Badge._SafeStr_4618 != null)
            {
                Badge._SafeStr_4618.dispose();
                Badge._SafeStr_4618 = null;
            };
            _disposed = true;
            _SafeStr_4360 = null;
            _windowManager = null;
            _SafeStr_4145 = null;
            _SafeStr_5029 = null;
            if (_SafeStr_5028)
            {
                _SafeStr_5028.dispose();
                _SafeStr_5028 = null;
            };
            if (_SafeStr_3882 != null)
            {
                _SafeStr_3882.dispose();
                _SafeStr_3882 = null;
            };
            _assets = null;
            _communication = null;
        }

        public function requestInitialization():void
        {
            _communication.connection.send(new _SafeStr_600());
        }

        public function getMaxActiveCount():int
        {
            return (5);
        }

        public function updateView():void
        {
            if (_SafeStr_3882 != null)
            {
                _SafeStr_3882.updateAll(null);
            };
        }

        public function updateActionView():void
        {
            _SafeStr_3882.updateActionView();
        }

        private function startWearingBadge(_arg_1:Badge):void
        {
            _SafeStr_5029.push(_arg_1);
            _arg_1.isInUse = true;
        }

        private function stopWearingBadge(_arg_1:Badge):void
        {
            var _local_2:int;
            _local_2 = 0;
            while (_local_2 < _SafeStr_5029.length)
            {
                if (_SafeStr_5029[_local_2] == _arg_1)
                {
                    _SafeStr_5029.splice(_local_2, 1);
                    _arg_1.isInUse = false;
                    return;
                };
                _local_2++;
            };
        }

        private function resetBadges():void
        {
            if (_SafeStr_5028)
            {
                _SafeStr_5028.dispose();
                _SafeStr_5028 = null;
            };
            if (_SafeStr_4145 != null)
            {
                for each (var _local_1:Badge in _SafeStr_4145)
                {
                    _local_1.dispose();
                };
                _SafeStr_4145 = null;
            };
            if (_SafeStr_5029 != null)
            {
                _SafeStr_5029 = null;
            };
        }

        public function initBadges(_arg_1:_SafeStr_24):void
        {
            var _local_3:int;
            var _local_6:Boolean;
            var _local_5:* = null;
            var _local_7:* = null;
            var _local_2:* = null;
            resetBadges();
            _SafeStr_4145 = new Vector.<Badge>(0);
            _SafeStr_5029 = new Vector.<Badge>(0);
            _SafeStr_5028 = new _SafeStr_24();
            for each (var _local_4:String in _arg_1.getKeys())
            {
                _local_3 = _arg_1.getValue(_local_4);
                if (_local_3 > 0)
                {
                    _SafeStr_5028.add(_local_4, _local_3);
                };
                _local_6 = _SafeStr_4360.unseenItemTracker.isUnseen(4, _local_3);
                _local_5 = controller.localization.getBadgeName(_local_4);
                _local_7 = controller.localization.getBadgeDesc(_local_4);
                _local_2 = new Badge(this, _local_4, _local_5, _local_7, _local_6);
                if (_local_6)
                {
                    _SafeStr_4145.unshift(_local_2);
                }
                else
                {
                    _SafeStr_4145.push(_local_2);
                };
            };
        }

        public function updateBadge(_arg_1:String, _arg_2:Boolean, _arg_3:int=0):void
        {
            var _local_7:Boolean;
            var _local_6:* = null;
            var _local_8:* = null;
            var _local_4:* = null;
            if (((_arg_3 > 0) && (!(_SafeStr_5028.hasKey(_arg_1)))))
            {
                _SafeStr_5028.add(_arg_1, _arg_3);
            };
            var _local_5:Badge = getBadge(_arg_1);
            if (_local_5 != null)
            {
                if (_local_5.isInUse != _arg_2)
                {
                    if (_arg_2)
                    {
                        startWearingBadge(_local_5);
                    }
                    else
                    {
                        stopWearingBadge(_local_5);
                    };
                };
            }
            else
            {
                _local_7 = _SafeStr_4360.unseenItemTracker.isUnseen(4, _arg_3);
                _local_6 = controller.localization.getBadgeName(_arg_1);
                _local_8 = controller.localization.getBadgeDesc(_arg_1);
                _local_4 = new Badge(this, _arg_1, _local_6, _local_8, _local_7);
                if (_local_7)
                {
                    _SafeStr_4145.unshift(_local_4);
                }
                else
                {
                    _SafeStr_4145.push(_local_4);
                };
                if (_arg_2)
                {
                    startWearingBadge(_local_4);
                };
            };
        }

        private function getBadge(_arg_1:String):Badge
        {
            var _local_3:int;
            var _local_2:* = null;
            _local_3 = 0;
            while (_local_3 < _SafeStr_4145.length)
            {
                _local_2 = _SafeStr_4145[_local_3];
                if (_local_2.badgeId == _arg_1)
                {
                    return (_local_2);
                };
                _local_3++;
            };
            return (null);
        }

        public function removeBadge(_arg_1:String):void
        {
            var _local_3:int;
            var _local_2:* = null;
            _local_3 = 0;
            while (_local_3 < _SafeStr_4145.length)
            {
                _local_2 = _SafeStr_4145[_local_3];
                if (_local_2.badgeId == _arg_1)
                {
                    _SafeStr_4145.splice(_local_3, 1);
                    stopWearingBadge(_local_2);
                    updateView();
                    return;
                };
                _local_3++;
            };
        }

        public function toggleBadgeWearing(_arg_1:String):void
        {
            var _local_2:Badge = getBadge(_arg_1);
            if (_local_2 != null)
            {
                if (_local_2.isInUse)
                {
                    stopWearingBadge(_local_2);
                }
                else
                {
                    startWearingBadge(_local_2);
                };
                saveBadgeSelection();
            };
        }

        public function saveBadgeSelection():void
        {
            var _local_4:int;
            var _local_2:* = null;
            var _local_1:_SafeStr_1028 = new _SafeStr_1028();
            var _local_3:Vector.<Badge> = getBadges(1);
            _local_4 = 0;
            while (_local_4 < _local_3.length)
            {
                _local_2 = _local_3[_local_4];
                _local_1.addActivatedBadge(_local_2.badgeId);
                _local_4++;
            };
            _communication.connection.send(_local_1);
        }

        public function setBadgeSelected(_arg_1:String):void
        {
            var _local_3:int;
            var _local_2:* = null;
            _local_3 = 0;
            while (_local_3 < _SafeStr_4145.length)
            {
                _local_2 = (_SafeStr_4145[_local_3] as Badge);
                if (_local_2 != null)
                {
                    _local_2.isSelected = (_local_2.badgeId == _arg_1);
                };
                _local_3++;
            };
            updateActionView();
        }

        public function forceSelection():void
        {
            var _local_1:Badge = getSelectedBadge();
            if (_local_1 != null)
            {
                return;
            };
            var _local_3:Vector.<Badge> = getBadges(0);
            if (((!(_local_3 == null)) && (_local_3.length > 0)))
            {
                _local_1 = (_local_3[0] as Badge);
                _local_1.isSelected = true;
                updateView();
                return;
            };
            var _local_2:Vector.<Badge> = getBadges(1);
            if (((!(_local_2 == null)) && (_local_2.length > 0)))
            {
                _local_1 = (_local_2[0] as Badge);
                _local_1.isSelected = true;
                updateView();
            };
        }

        public function getSelectedBadge(_arg_1:int=-1):Badge
        {
            var _local_4:int;
            var _local_3:* = null;
            var _local_2:Vector.<Badge> = getBadges(_arg_1);
            _local_4 = 0;
            while (_local_4 < _local_2.length)
            {
                _local_3 = _local_2[_local_4];
                if (_local_3.isSelected)
                {
                    return (_local_3);
                };
                _local_4++;
            };
            return (null);
        }

        public function getBadges(_arg_1:int=-1):Vector.<Badge>
        {
            var _local_3:*;
            switch (_arg_1)
            {
                case -1:
                    return (_SafeStr_4145);
                case 0:
                    _local_3 = new Vector.<Badge>(0);
                    for each (var _local_2:Badge in _SafeStr_4145)
                    {
                        if (!_local_2.isInUse)
                        {
                            _local_3.push(_local_2);
                        };
                    };
                    return (_local_3);
                case 1:
                    return (_SafeStr_5029);
                default:
                    _SafeStr_14.log("Unexpected filter. Returning an empty array to maintain backward compatibility");
                    return (new Vector.<Badge>(0));
            };
        }

        public function getBadgeFromActive(_arg_1:int):Badge
        {
            return (getItemInIndex(_arg_1, 1));
        }

        public function getBadgeFromInactive(_arg_1:int):Badge
        {
            return (getItemInIndex(_arg_1, 0));
        }

        public function getItemInIndex(_arg_1:int, _arg_2:int=-1):Badge
        {
            var _local_3:Vector.<Badge> = getBadges(_arg_2);
            if (((_arg_1 < 0) || (_arg_1 >= _local_3.length)))
            {
                return (null);
            };
            return (_local_3[_arg_1]);
        }

        public function getWindowContainer():_SafeStr_3133
        {
            return (_SafeStr_3882.getWindowContainer());
        }

        public function closingInventoryView():void
        {
            if (_SafeStr_3882.isVisible)
            {
                resetUnseenItems();
            };
        }

        public function categorySwitch(_arg_1:String):void
        {
            if (((_arg_1 == "badges") && (_SafeStr_4360.isVisible)))
            {
                _SafeStr_4360.events.dispatchEvent(new Event("HABBO_INVENTORY_TRACKING_EVENT_BADGES"));
            };
        }

        public function subCategorySwitch(_arg_1:String):void
        {
        }

        public function get controller():HabboInventory
        {
            return (_SafeStr_4360);
        }

        public function resetUnseenItems():void
        {
            if (!_SafeStr_4360.isMainViewActive)
            {
                return;
            };
            _SafeStr_4360.unseenItemTracker.resetCategory(4);
            for each (var _local_1:Badge in _SafeStr_4145)
            {
                _local_1.isUnseen = false;
            };
            updateView();
            _SafeStr_4360.updateUnseenItemCounts();
        }

        public function selectItemById(_arg_1:String):void
        {
            setBadgeSelected(_arg_1);
        }

        public function removeSelections():void
        {
            for each (var _local_1:Badge in _SafeStr_4145)
            {
                _local_1.isSelected = false;
            };
        }


    }
}//package com.sulake.habbo.inventory.badges

// _SafeStr_1028 = "_-h1v" (String#23465, DoABC#4)
// _SafeStr_14 = "_-ED" (String#155, DoABC#4)
// _SafeStr_1695 = "_-sN" (String#340, DoABC#4)
// _SafeStr_21 = "_-61a" (String#265, DoABC#4)
// _SafeStr_24 = "_-W1s" (String#60, DoABC#4)
// _SafeStr_25 = "_-G19" (String#757, DoABC#4)
// _SafeStr_3133 = "_-U1F" (String#18, DoABC#4)
// _SafeStr_3882 = "_-D10" (String#53, DoABC#4)
// _SafeStr_4145 = "_-ZY" (String#1480, DoABC#4)
// _SafeStr_4360 = "_-58" (String#91, DoABC#4)
// _SafeStr_4618 = "_-X1U" (String#11425, DoABC#4)
// _SafeStr_5028 = "_-Pe" (String#4633, DoABC#4)
// _SafeStr_5029 = "_-ai" (String#5083, DoABC#4)
// _SafeStr_600 = "_-1p" (String#22394, DoABC#4)


