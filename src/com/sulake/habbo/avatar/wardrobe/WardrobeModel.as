// Decompiled by AS3 Sorcerer 6.30
// www.as3sorcerer.com

//com.sulake.habbo.avatar.wardrobe.WardrobeModel

package com.sulake.habbo.avatar.wardrobe
{
    import com.sulake.habbo.avatar.common.ISideContentModel;
    import com.sulake.habbo.avatar.HabboAvatarEditor;
    import com.sulake.core.utils._SafeStr_24;
    import com.sulake.core.window._SafeStr_3133;
    import com.sulake.core.utils.ErrorReportStorage;
    import _-a1N._SafeStr_1610;

    public class WardrobeModel implements ISideContentModel 
    {

        private var _SafeStr_4360:HabboAvatarEditor;
        private var _SafeStr_3882:WardrobeView;
        private var _SafeStr_6420:_SafeStr_24;
        private var _SafeStr_3883:Boolean = false;

        public function WardrobeModel(_arg_1:HabboAvatarEditor)
        {
            _SafeStr_4360 = _arg_1;
        }

        public function dispose():void
        {
            _SafeStr_4360 = null;
            for each (var _local_1:WardrobeSlot in _SafeStr_6420)
            {
                _local_1.dispose();
                _local_1 = null;
            };
            _SafeStr_6420 = null;
            if (_SafeStr_3882)
            {
                _SafeStr_3882.dispose();
                _SafeStr_3882 = null;
            };
            _SafeStr_3883 = false;
        }

        public function reset():void
        {
            _SafeStr_3883 = false;
        }

        private function init():void
        {
            var _local_1:int;
            if (_SafeStr_3882)
            {
                _SafeStr_3882.dispose();
            };
            _SafeStr_3882 = new WardrobeView(this);
            if (_SafeStr_4360.handler != null)
            {
                _SafeStr_4360.handler.getWardrobe();
            };
            if (_SafeStr_6420)
            {
                for each (var _local_2:WardrobeSlot in _SafeStr_6420)
                {
                    _local_2.dispose();
                    _local_2 = null;
                };
            };
            _SafeStr_6420 = new _SafeStr_24();
            _local_1 = 1;
            while (_local_1 <= 10)
            {
                _SafeStr_6420.add(_local_1, new WardrobeSlot(_SafeStr_3882.slotWindowTemplate, _SafeStr_4360, _local_1, isSlotEnabled(_local_1)));
                _local_1++;
            };
            _SafeStr_3883 = true;
            updateView();
        }

        public function get controller():HabboAvatarEditor
        {
            return (_SafeStr_4360);
        }

        public function getWindowContainer():_SafeStr_3133
        {
            if (!_SafeStr_3883)
            {
                init();
            };
            return (_SafeStr_3882.getWindowContainer());
        }

        private function updateView():void
        {
            _SafeStr_3882.update();
        }

        public function updateSlots(_arg_1:int, _arg_2:Array):void
        {
            var _local_3:* = null;
            if (!_SafeStr_3883)
            {
                return;
            };
            if (!_arg_2)
            {
                ErrorReportStorage.addDebugData("WardrobeModel", "updateSlots: outfits is null!");
            };
            if (!_SafeStr_6420)
            {
                ErrorReportStorage.addDebugData("WardrobeModel", "updateSlots: _slots is null!");
            };
            for each (var _local_4:_SafeStr_1610 in _arg_2)
            {
                _local_3 = (_SafeStr_6420.getValue(_local_4.slotId) as WardrobeSlot);
                if (_local_3)
                {
                    _local_3.update(_local_4.figureString, _local_4.gender, isSlotEnabled(_local_3.id));
                };
            };
        }

        private function isSlotEnabled(_arg_1:int):Boolean
        {
            if (_arg_1 <= 5)
            {
                return (_SafeStr_4360.manager.sessionData.hasClub);
            };
            return (_SafeStr_4360.manager.sessionData.hasVip);
        }

        public function get slots():Array
        {
            return (_SafeStr_6420.getValues());
        }


    }
}//package com.sulake.habbo.avatar.wardrobe

// _SafeStr_1610 = "_-jW" (String#32480, DoABC#4)
// _SafeStr_24 = "_-W1s" (String#60, DoABC#4)
// _SafeStr_3133 = "_-U1F" (String#18, DoABC#4)
// _SafeStr_3882 = "_-D10" (String#53, DoABC#4)
// _SafeStr_3883 = "_-w1c" (String#683, DoABC#4)
// _SafeStr_4360 = "_-58" (String#91, DoABC#4)
// _SafeStr_6420 = "_-yi" (String#2064, DoABC#4)


