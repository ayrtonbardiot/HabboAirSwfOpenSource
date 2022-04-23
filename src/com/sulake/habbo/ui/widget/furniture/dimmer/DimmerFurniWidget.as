// Decompiled by AS3 Sorcerer 6.30
// www.as3sorcerer.com

//com.sulake.habbo.ui.widget.furniture.dimmer.DimmerFurniWidget

package com.sulake.habbo.ui.widget.furniture.dimmer
{
    import com.sulake.habbo.ui.widget.RoomWidgetBase;
    import com.sulake.habbo.ui.IRoomWidgetHandler;
    import com.sulake.habbo.window._SafeStr_1695;
    import com.sulake.core.assets._SafeStr_21;
    import com.sulake.habbo.localization._SafeStr_18;
    import flash.events.IEventDispatcher;
    import com.sulake.habbo.ui.widget.events.RoomWidgetDimmerUpdateEvent;
    import com.sulake.habbo.ui.widget.messages.RoomWidgetDimmerPreviewMessage;
    import com.sulake.habbo.ui.widget.events.RoomWidgetDimmerStateUpdateEvent;
    import com.sulake.habbo.ui.widget.messages.RoomWidgetDimmerSavePresetMessage;
    import com.sulake.habbo.ui.widget.messages.RoomWidgetDimmerChangeStateMessage;

    public class DimmerFurniWidget extends RoomWidgetBase 
    {

        private static const AVAILABLE_COLORS:Array = new Array(7665141, 21495, 15161822, 15353138, 15923281, 8581961, 0);
        private static const _SafeStr_4023:Array = new Array(76, 76);

        private var _SafeStr_3882:DimmerView;
        private var _SafeStr_4022:Array;
        private var _SafeStr_4024:int;
        private var _SafeStr_4021:int;
        private var _SafeStr_4026:int;
        private var _color:uint = 0xFFFFFF;
        private var _SafeStr_4025:uint = 0xFF;

        public function DimmerFurniWidget(_arg_1:IRoomWidgetHandler, _arg_2:_SafeStr_1695, _arg_3:_SafeStr_21=null, _arg_4:_SafeStr_18=null)
        {
            super(_arg_1, _arg_2, _arg_3, _arg_4);
        }

        public function get dimmerState():int
        {
            return (_SafeStr_4021);
        }

        public function get presets():Array
        {
            return (_SafeStr_4022);
        }

        public function get colors():Array
        {
            return (AVAILABLE_COLORS);
        }

        public function get minLights():Array
        {
            return (_SafeStr_4023);
        }

        public function get selectedPresetIndex():int
        {
            return (_SafeStr_4024);
        }

        public function set selectedPresetIndex(_arg_1:int):void
        {
            _SafeStr_4024 = _arg_1;
        }

        override public function dispose():void
        {
            disposeInterface();
            _SafeStr_4022 = null;
            super.dispose();
        }

        override public function registerUpdateEvents(_arg_1:IEventDispatcher):void
        {
            if (_arg_1 == null)
            {
                return;
            };
            _arg_1.addEventListener("RWDUE_PRESETS", onPresets);
            _arg_1.addEventListener("RWDUE_HIDE", onHide);
            _arg_1.addEventListener("RWDSUE_DIMMER_STATE", onDimmerState);
            super.registerUpdateEvents(_arg_1);
        }

        override public function unregisterUpdateEvents(_arg_1:IEventDispatcher):void
        {
            if (_arg_1 == null)
            {
                return;
            };
            _arg_1.removeEventListener("RWDUE_PRESETS", onPresets);
            _arg_1.removeEventListener("RWDUE_HIDE", onHide);
            _arg_1.removeEventListener("RWDSUE_DIMMER_STATE", onDimmerState);
        }

        private function onPresets(_arg_1:RoomWidgetDimmerUpdateEvent):void
        {
            var _local_3:int;
            var _local_4:* = null;
            var _local_2:* = null;
            _SafeStr_4024 = (_arg_1.selectedPresetId - 1);
            _SafeStr_4022 = [];
            _local_3 = 0;
            while (_local_3 < _arg_1.presets.length)
            {
                _local_4 = _arg_1.presets[_local_3];
                _local_2 = new DimmerFurniWidgetPresetItem(_local_4.id, _local_4.type, _local_4.color, _local_4.light);
                _SafeStr_4022.push(_local_2);
                _local_3++;
            };
            showInterface();
        }

        private function onHide(_arg_1:RoomWidgetDimmerUpdateEvent):void
        {
            disposeInterface();
        }

        private function disposeInterface():void
        {
            if (_SafeStr_3882 != null)
            {
                _SafeStr_3882.dispose();
                _SafeStr_3882 = null;
            };
        }

        private function onDimmerState(_arg_1:RoomWidgetDimmerStateUpdateEvent):void
        {
            var _local_2:* = null;
            if (_arg_1 == null)
            {
                return;
            };
            _SafeStr_4021 = _arg_1.state;
            _SafeStr_4026 = _arg_1.effectId;
            _color = _arg_1.color;
            _SafeStr_4025 = _arg_1.brightness;
            if (_SafeStr_3882 != null)
            {
                _SafeStr_3882.update();
            };
            if (!validateBrightness(_SafeStr_4025, _SafeStr_4026))
            {
                return;
            };
            _local_2 = new RoomWidgetDimmerPreviewMessage(_color, _SafeStr_4025, (_SafeStr_4026 == 2));
            messageListener.processWidgetMessage(_local_2);
        }

        private function showInterface():void
        {
            if (_SafeStr_3882 == null)
            {
                _SafeStr_3882 = new DimmerView(this);
            };
            if (_SafeStr_3882 != null)
            {
                _SafeStr_3882.showInterface();
            };
        }

        public function storeCurrentSetting(_arg_1:Boolean):void
        {
            var _local_6:* = null;
            if (_SafeStr_4021 == 0)
            {
                return;
            };
            if (messageListener == null)
            {
                return;
            };
            var _local_7:int = (_SafeStr_4024 + 1);
            if ((((_SafeStr_4022 == null) || (_local_7 < 0)) || (_local_7 > _SafeStr_4022.length)))
            {
                return;
            };
            var _local_5:int = _SafeStr_3882.selectedType;
            var _local_4:uint = colors[_SafeStr_3882.selectedColorIndex];
            var _local_3:int = _SafeStr_3882.selectedBrightness;
            var _local_2:DimmerFurniWidgetPresetItem = (_SafeStr_4022[_SafeStr_4024] as DimmerFurniWidgetPresetItem);
            if ((((((!(_local_2 == null)) && (_local_2.type == _local_5)) && (_local_2.color == _local_4)) && (_local_2.light == _local_3)) && (!(_arg_1))))
            {
                return;
            };
            _local_2.type = _local_5;
            _local_2.color = _local_4;
            _local_2.light = _local_3;
            if (!validateBrightness(_local_3, _local_5))
            {
                return;
            };
            _local_6 = new RoomWidgetDimmerSavePresetMessage(_local_7, _local_5, _local_4, _local_3, _arg_1);
            messageListener.processWidgetMessage(_local_6);
        }

        public function previewCurrentSetting():void
        {
            var _local_1:* = null;
            if (_SafeStr_4021 == 0)
            {
                return;
            };
            if (messageListener == null)
            {
                return;
            };
            if (!validateBrightness(_SafeStr_3882.selectedBrightness, _SafeStr_3882.selectedType))
            {
                return;
            };
            _local_1 = new RoomWidgetDimmerPreviewMessage(colors[_SafeStr_3882.selectedColorIndex], _SafeStr_3882.selectedBrightness, (_SafeStr_3882.selectedType == 2));
            messageListener.processWidgetMessage(_local_1);
        }

        public function changeRoomDimmerState():void
        {
            var _local_1:* = null;
            if (messageListener != null)
            {
                _local_1 = new RoomWidgetDimmerChangeStateMessage();
                messageListener.processWidgetMessage(_local_1);
            };
        }

        public function removePreview():void
        {
            var _local_1:* = null;
            if (messageListener == null)
            {
                return;
            };
            if (!validateBrightness(_SafeStr_4025, _SafeStr_4026))
            {
                return;
            };
            _local_1 = new RoomWidgetDimmerPreviewMessage(_color, _SafeStr_4025, (_SafeStr_4026 == 2));
            messageListener.processWidgetMessage(_local_1);
        }

        private function validateBrightness(_arg_1:uint, _arg_2:int):Boolean
        {
            return (true);
        }


    }
}//package com.sulake.habbo.ui.widget.furniture.dimmer

// _SafeStr_1695 = "_-sN" (String#340, DoABC#4)
// _SafeStr_18 = "_-61x" (String#484, DoABC#4)
// _SafeStr_21 = "_-61a" (String#265, DoABC#4)
// _SafeStr_3882 = "_-D10" (String#53, DoABC#4)
// _SafeStr_4021 = "_-X14" (String#11841, DoABC#4)
// _SafeStr_4022 = "_-3L" (String#3262, DoABC#4)
// _SafeStr_4023 = "_-b3" (String#13781, DoABC#4)
// _SafeStr_4024 = "_-5F" (String#8771, DoABC#4)
// _SafeStr_4025 = "_-TO" (String#3020, DoABC#4)
// _SafeStr_4026 = "_-710" (String#4026, DoABC#4)


