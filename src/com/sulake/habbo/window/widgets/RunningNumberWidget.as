﻿// Decompiled by AS3 Sorcerer 6.30
// www.as3sorcerer.com

//com.sulake.habbo.window.widgets.RunningNumberWidget

package com.sulake.habbo.window.widgets
{
    import com.sulake.core.runtime._SafeStr_41;
    import com.sulake.core.window.utils.PropertyStruct;
    import com.sulake.core.window.components._SafeStr_3199;
    import com.sulake.habbo.window.HabboWindowManagerComponent;
    import com.sulake.core.window._SafeStr_3133;
    import com.sulake.core.window.iterators.EmptyIterator;
    import com.sulake.core.window.utils.IIterator;
    import com.sulake.core.window.components.ITextWindow;

    public class RunningNumberWidget implements IRunningNumberWidget, _SafeStr_41 
    {

        public static const TYPE:String = "running_number";
        private static const NUMBER_KEY:String = "running_number:number";
        private static const _SafeStr_9174:String = "running_number:digits";
        private static const COLOR_STYLE_KEY:String = "running_number:color_style";
        private static const _SafeStr_9188:String = "running_number:update_frequency";
        private static const NUMBER_DEFAULT:PropertyStruct = new PropertyStruct("running_number:number", 0, "int");
        private static const DIGITS_DEFAULT:PropertyStruct = new PropertyStruct("running_number:digits", 8, "uint");
        private static const COLOR_STYLE_DEFAULT:PropertyStruct = new PropertyStruct("running_number:color_style", 0, "int");
        private static const UPDATE_FREQUENCY_DEFAULT:PropertyStruct = new PropertyStruct("running_number:update_frequency", 50, "int");

        private var _disposed:Boolean;
        private var _SafeStr_5427:_SafeStr_3199;
        private var _windowManager:HabboWindowManagerComponent;
        private var _SafeStr_5428:_SafeStr_3133;
        private var _SafeStr_5689:int = COLOR_STYLE_DEFAULT.value;
        private var _SafeStr_5688:uint = DIGITS_DEFAULT.value;
        private var _SafeStr_5687:int = UPDATE_FREQUENCY_DEFAULT.value;
        private var _newNumber:int = NUMBER_DEFAULT.value;
        private var _displayedNumber:Number = 0;
        private var _millisSinceLastUpdate:uint = 0;

        public function RunningNumberWidget(_arg_1:_SafeStr_3199, _arg_2:HabboWindowManagerComponent)
        {
            _SafeStr_5427 = _arg_1;
            _windowManager = _arg_2;
            _SafeStr_5428 = (_windowManager.buildFromXML((_windowManager.assets.getAssetByName("running_number_xml").content as XML)) as _SafeStr_3133);
            _windowManager.registerUpdateReceiver(this, _SafeStr_5687);
            _SafeStr_5427.setParamFlag(147456);
            _SafeStr_5427.rootWindow = _SafeStr_5428;
        }

        public function dispose():void
        {
            if (!_disposed)
            {
                if (_SafeStr_5428 != null)
                {
                    _SafeStr_5428.dispose();
                    _SafeStr_5428 = null;
                };
                if (_SafeStr_5427 != null)
                {
                    _SafeStr_5427.rootWindow = null;
                    _SafeStr_5427 = null;
                };
                _windowManager.removeUpdateReceiver(this);
                _windowManager = null;
                _disposed = true;
            };
        }

        public function get disposed():Boolean
        {
            return (_disposed);
        }

        public function get properties():Array
        {
            var _local_1:Array = [];
            if (_disposed)
            {
                return (_local_1);
            };
            _local_1.push(NUMBER_DEFAULT.withValue(colorStyle));
            _local_1.push(COLOR_STYLE_DEFAULT.withValue(colorStyle));
            _local_1.push(DIGITS_DEFAULT.withValue(digits));
            _local_1.push(UPDATE_FREQUENCY_DEFAULT.withValue(updateFrequency));
            return (_local_1);
        }

        public function set properties(_arg_1:Array):void
        {
            if (_disposed)
            {
                return;
            };
            for each (var _local_2:PropertyStruct in _arg_1)
            {
                switch (_local_2.key)
                {
                    case "running_number:number":
                        number = _local_2.value;
                        break;
                    case "running_number:digits":
                        digits = _local_2.value;
                        break;
                    case "running_number:color_style":
                        colorStyle = _local_2.value;
                        break;
                    case "running_number:update_frequency":
                        updateFrequency = _local_2.value;
                };
            };
        }

        public function get iterator():IIterator
        {
            return (EmptyIterator.INSTANCE);
        }

        public function update(_arg_1:uint):void
        {
            if (_displayedNumber < number)
            {
                _millisSinceLastUpdate = (_millisSinceLastUpdate + _arg_1);
                if (_millisSinceLastUpdate > _SafeStr_5687)
                {
                    _displayedNumber = Math.min(_newNumber, (_displayedNumber + (_millisSinceLastUpdate / _SafeStr_5687)));
                    _millisSinceLastUpdate = (_millisSinceLastUpdate - _SafeStr_5687);
                };
                fieldValue = _displayedNumber;
            };
        }

        private function set fieldValue(_arg_1:uint):void
        {
            var _local_3:String = _arg_1.toString();
            while (_local_3.length < _SafeStr_5688)
            {
                _local_3 = ("0" + _local_3);
            };
            var _local_2:ITextWindow = ITextWindow(_SafeStr_5428.findChildByName("number_field"));
            _local_2.text = _local_3;
            _local_2.invalidate();
        }

        public function get digits():uint
        {
            return (_SafeStr_5688);
        }

        public function set digits(_arg_1:uint):void
        {
            _SafeStr_5688 = _arg_1;
        }

        public function get colorStyle():int
        {
            return (_SafeStr_5689);
        }

        public function set colorStyle(_arg_1:int):void
        {
            _SafeStr_5689 = _arg_1;
        }

        public function get updateFrequency():int
        {
            return (_SafeStr_5687);
        }

        public function set updateFrequency(_arg_1:int):void
        {
            _SafeStr_5687 = _arg_1;
        }

        public function get number():int
        {
            return (_newNumber);
        }

        public function set number(_arg_1:int):void
        {
            _newNumber = _arg_1;
        }

        public function set initialNumber(_arg_1:int):void
        {
            _displayedNumber = _arg_1;
            _newNumber = _arg_1;
            fieldValue = _displayedNumber;
        }


    }
}//package com.sulake.habbo.window.widgets

// _SafeStr_3133 = "_-U1F" (String#18, DoABC#4)
// _SafeStr_3199 = "_-Z1u" (String#359, DoABC#4)
// _SafeStr_41 = "_-m5" (String#2087, DoABC#4)
// _SafeStr_5427 = "_-h1n" (String#409, DoABC#4)
// _SafeStr_5428 = "_-L19" (String#253, DoABC#4)
// _SafeStr_5687 = "_-6e" (String#7273, DoABC#4)
// _SafeStr_5688 = "_-J1Y" (String#10331, DoABC#4)
// _SafeStr_5689 = "_-SJ" (String#5955, DoABC#4)
// _SafeStr_9174 = "_-Mz" (String#30120, DoABC#4)
// _SafeStr_9188 = "_-nf" (String#32173, DoABC#4)


