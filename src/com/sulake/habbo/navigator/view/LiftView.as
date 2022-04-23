// Decompiled by AS3 Sorcerer 6.30
// www.as3sorcerer.com

//com.sulake.habbo.navigator.view.LiftView

package com.sulake.habbo.navigator.view
{
    import com.sulake.core.runtime._SafeStr_41;
    import com.sulake.habbo.navigator.HabboNewNavigator;
    import com.sulake.core.window.components._SafeStr_3195;
    import com.sulake.core.window.components.IItemListWindow;
    import com.sulake.core.window.components.IRegionWindow;
    import flash.utils.getTimer;
    import com.sulake.core.window.components.IStaticBitmapWrapperWindow;
    import com.sulake.core.window.events._SafeStr_3116;
    import com.sulake.core.window._SafeStr_3109;

    public class LiftView implements _SafeStr_41 
    {

        private static const AUTO_CYCLE_TIMEOUT_MS:uint = 8000;

        private var _navigator:HabboNewNavigator;
        private var _SafeStr_5654:_SafeStr_3195;
        private var _SafeStr_5655:IItemListWindow;
        private var _SafeStr_5657:IRegionWindow;
        private var _SafeStr_5656:int = -1;
        private var _SafeStr_5658:uint = getTimer();

        public function LiftView(_arg_1:HabboNewNavigator)
        {
            _navigator = _arg_1;
            _navigator.registerUpdateReceiver(this, 1000);
        }

        public function dispose():void
        {
            _navigator.removeUpdateReceiver(this);
            _navigator = null;
        }

        public function get disposed():Boolean
        {
            return (_navigator == null);
        }

        public function set pagerIconTemplate(_arg_1:IRegionWindow):void
        {
            _SafeStr_5657 = _arg_1;
        }

        public function set borderWindow(_arg_1:_SafeStr_3195):void
        {
            _SafeStr_5654 = _arg_1;
            _SafeStr_5655 = IItemListWindow(_SafeStr_5654.findChildByName("pager_itemlist"));
            IRegionWindow(_SafeStr_5654.findChildByName("room_image_click_region")).procedure = goToRoomRegionProcedure;
        }

        public function refresh(_arg_1:Boolean=true):void
        {
            var _local_2:int;
            _SafeStr_5655.destroyListItems();
            _SafeStr_5656 = ((_arg_1) ? 0 : _SafeStr_5656);
            _local_2 = 0;
            while (_local_2 < _navigator.liftDataContainer.liftedRooms.length)
            {
                _SafeStr_5655.addListItem(_SafeStr_5657.clone());
                _local_2++;
            };
            setPagerToSelectedPage();
            drawSelectedPage();
        }

        private function setPagerToSelectedPage():void
        {
            var _local_1:int;
            var _local_2:* = null;
            _local_1 = 0;
            while (_local_1 < _SafeStr_5655.numListItems)
            {
                _local_2 = IRegionWindow(_SafeStr_5655.getListItemAt(_local_1));
                IStaticBitmapWrapperWindow(_local_2.findChildByName("icon")).assetUri = ((_local_1 == _SafeStr_5656) ? "progress_disk_flat_on" : "progress_disk_flat_off");
                _local_2.id = _local_1;
                _local_2.procedure = pagerPageProcedure;
                _local_1++;
            };
        }

        private function drawSelectedPage():void
        {
            setPagerToSelectedPage();
            IStaticBitmapWrapperWindow(_SafeStr_5654.findChildByName("room_image")).assetUri = _navigator.liftDataContainer.getUrlForLiftImageAtIndex(_SafeStr_5656);
            if (_SafeStr_5656 < _navigator.liftDataContainer.liftedRooms.length)
            {
                _SafeStr_5654.findChildByName("caption_text").caption = _navigator.liftDataContainer.liftedRooms[_SafeStr_5656].caption;
            };
        }

        private function autoCycleToNextPage():void
        {
            _SafeStr_5656++;
            if (_SafeStr_5656 > (_navigator.liftDataContainer.liftedRooms.length - 1))
            {
                _SafeStr_5656 = 0;
            };
            refresh(false);
        }

        public function update(_arg_1:uint):void
        {
            var _local_2:uint = getTimer();
            if ((_SafeStr_5658 + 8000) < _local_2)
            {
                autoCycleToNextPage();
                _SafeStr_5658 = _local_2;
            };
        }

        private function pagerPageProcedure(_arg_1:_SafeStr_3116, _arg_2:_SafeStr_3109):void
        {
            if (_arg_1.type == "WME_CLICK")
            {
                if (_arg_2.id != _SafeStr_5656)
                {
                    _SafeStr_5656 = _arg_2.id;
                    drawSelectedPage();
                    _SafeStr_5658 = getTimer();
                    _navigator.trackEventLog("browse.promotion", "Promotion", "", _SafeStr_5656);
                };
            };
        }

        private function goToRoomRegionProcedure(_arg_1:_SafeStr_3116, _arg_2:_SafeStr_3109):void
        {
            if (_arg_1.type == "WME_CLICK")
            {
                if (_navigator.liftDataContainer.liftedRooms.length > _SafeStr_5656)
                {
                    _navigator.goToRoom(_navigator.liftDataContainer.liftedRooms[_SafeStr_5656].flatId, "promotion");
                };
            };
        }


    }
}//package com.sulake.habbo.navigator.view

// _SafeStr_3109 = "_-s1L" (String#23, DoABC#4)
// _SafeStr_3116 = "_-XC" (String#59, DoABC#4)
// _SafeStr_3195 = "_-b1g" (String#876, DoABC#4)
// _SafeStr_41 = "_-m5" (String#2087, DoABC#4)
// _SafeStr_5654 = "_-3n" (String#10984, DoABC#4)
// _SafeStr_5655 = "_-lf" (String#11026, DoABC#4)
// _SafeStr_5656 = "_-oo" (String#3900, DoABC#4)
// _SafeStr_5657 = "_-rt" (String#18038, DoABC#4)
// _SafeStr_5658 = "_-p1d" (String#8899, DoABC#4)


