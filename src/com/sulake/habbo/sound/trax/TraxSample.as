﻿// Decompiled by AS3 Sorcerer 6.30
// www.as3sorcerer.com

//com.sulake.habbo.sound.trax.TraxSample

package com.sulake.habbo.sound.trax
{
    import com.sulake.core.runtime._SafeStr_13;
    import __AS3__.vec.Vector;
    import flash.utils.ByteArray;

    public class TraxSample implements _SafeStr_13 
    {

        public static const SAMPLE_FREQUENCY_44KHZ:String = "sample_44khz";
        public static const SAMPLE_FREQUENCY_22KHZ:String = "sample_22khz";
        public static const SAMPLE_FREQUENCY_11KHZ:String = "sample_11khz";
        public static const SAMPLE_SCALE_16BIT:String = "sample_16bit";
        public static const SAMPLE_SCALE_8BIT:String = "sample_8bit";
        public static const SAMPLE_VALUE_MULTIPLIER:Number = 3.0517578125E-5;
        private static const FADEOUT_LENGTH:int = 32;
        private static const MASK_8BIT:int = 0xFF;
        private static const MASK_16BIT:int = 0xFFFF;
        private static const OFFSET_8BIT:int = 127;
        private static const OFFSET_16BIT:int = 32767;

        private var _disposed:Boolean = false;
        private var _sampleData:Vector.<int> = null;
        private var _SafeStr_3820:int;
        private var _SafeStr_5727:int = 2;
        private var _SafeStr_5728:int = 1;
        private var _SafeStr_5729:Array = [];
        private var _SafeStr_5730:uint;

        public function TraxSample(_arg_1:ByteArray, _arg_2:int, _arg_3:String="sample_44khz", _arg_4:String="sample_16bit")
        {
            var _local_8:int;
            var _local_16:Number;
            var _local_10:int;
            var _local_6:Number;
            var _local_5:Number;
            var _local_11:int;
            super();
            _SafeStr_3820 = _arg_2;
            var _local_12:* = 0x10000;
            switch (_arg_3)
            {
                case "sample_22khz":
                    _SafeStr_5728 = 2;
                    break;
                case "sample_11khz":
                    _SafeStr_5728 = 4;
                    break;
                default:
                    _SafeStr_5728 = 1;
            };
            switch (_arg_4)
            {
                case "sample_8bit":
                    _SafeStr_5727 = 4;
                    _local_12 = 0x0100;
                    break;
                default:
                    _SafeStr_5727 = 2;
                    _local_12 = 0x10000;
            };
            var _local_15:int = (_SafeStr_5727 * _SafeStr_5728);
            var _local_14:int = int((_arg_1.length / 8));
            _local_14 = int((int((_local_14 / _local_15)) * _local_15));
            _sampleData = new Vector.<int>((_local_14 / _local_15), true);
            var _local_13:Number = (1 / (_local_12 / 2));
            _arg_1.position = 0;
            var _local_9:int;
            var _local_7:int = int((_local_14 / _SafeStr_5728));
            _local_8 = 0;
            while (_local_8 < _local_7)
            {
                _local_16 = _arg_1.readFloat();
                _arg_1.readFloat();
                _local_10 = 2;
                while (_local_10 <= _SafeStr_5728)
                {
                    _local_6 = _arg_1.readFloat();
                    _arg_1.readFloat();
                    _local_5 = _local_10;
                    _local_16 = (((_local_16 * (_local_5 - 1)) / _local_5) + (_local_6 / _local_5));
                    _local_10++;
                };
                if (_local_8 >= ((_local_7 - 1) - 32))
                {
                    _local_16 = (_local_16 * (((_local_7 - _local_8) - 1) / 32));
                };
                _local_11 = int(((_local_16 + 1) / _local_13));
                if (_local_11 < 0)
                {
                    _local_11 = 0;
                }
                else
                {
                    if (_local_11 >= _local_12)
                    {
                        _local_11 = (_local_12 - 1);
                    };
                };
                _local_9 = (_local_9 * _local_12);
                _local_9 = (_local_9 + _local_11);
                if ((_local_8 % _SafeStr_5727) == (_SafeStr_5727 - 1))
                {
                    _sampleData[int((_local_8 / _SafeStr_5727))] = _local_9;
                    _local_9 = 0;
                };
                _local_8++;
            };
        }

        public function get id():int
        {
            return (_SafeStr_3820);
        }

        public function get length():uint
        {
            return ((_sampleData.length * _SafeStr_5727) * _SafeStr_5728);
        }

        public function get usageCount():int
        {
            return (_SafeStr_5729.length);
        }

        public function get usageTimeStamp():int
        {
            return (_SafeStr_5730);
        }

        public function get disposed():Boolean
        {
            return (_disposed);
        }

        public function dispose():void
        {
            if (!_disposed)
            {
                _sampleData = null;
                _SafeStr_5729 = null;
            };
        }

        public function setSample(_arg_1:Vector.<int>, _arg_2:int, _arg_3:int, _arg_4:int):int
        {
            var _local_10:int;
            var _local_9:int;
            var _local_6:int;
            if (((_arg_1 == null) || (_sampleData == null)))
            {
                return (_arg_4);
            };
            var _local_5:int = (_SafeStr_5727 * _SafeStr_5728);
            _arg_4 = int((_arg_4 / _local_5));
            if (_arg_2 < 0)
            {
                _arg_3 = (_arg_3 + _arg_2);
                _arg_2 = 0;
            };
            if (_arg_3 > (_arg_1.length - _arg_2))
            {
                _arg_3 = (_arg_1.length - _arg_2);
            };
            var _local_8:int = int((_arg_3 / _local_5));
            var _local_7:int;
            if (_local_8 > (_sampleData.length - _arg_4))
            {
                _local_7 = ((_local_8 - (_sampleData.length - _arg_4)) * _local_5);
                _local_8 = (_sampleData.length - _arg_4);
                if (_local_7 > (_arg_1.length - _arg_2))
                {
                    _local_7 = (_arg_1.length - _arg_2);
                };
            };
            if (_SafeStr_5728 == 1)
            {
                if (_SafeStr_5727 == 2)
                {
                    while (_local_8-- > 0)
                    {
                        _local_10 = int(_sampleData[_arg_4++]);
                        _arg_1[_arg_2++] = (((_local_10 >> 16) & 0xFFFF) - 32767);
                        _arg_1[_arg_2++] = ((_local_10 & 0xFFFF) - 32767);
                    };
                }
                else
                {
                    if (_SafeStr_5727 == 4)
                    {
                        while (_local_8-- > 0)
                        {
                            _local_10 = int(_sampleData[_arg_4++]);
                            _arg_1[_arg_2++] = ((((_local_10 >> 24) & 0xFF) - 127) << 8);
                            _arg_1[_arg_2++] = ((((_local_10 >> 16) & 0xFF) - 127) << 8);
                            _arg_1[_arg_2++] = ((((_local_10 >> 8) & 0xFF) - 127) << 8);
                            _arg_1[_arg_2++] = (((_local_10 & 0xFF) - 127) << 8);
                        };
                    };
                };
            }
            else
            {
                if (_SafeStr_5728 >= 2)
                {
                    _local_9 = 0;
                    _local_6 = 0;
                    if (_SafeStr_5727 == 2)
                    {
                        while (_local_8-- > 0)
                        {
                            _local_10 = int(_sampleData[_arg_4++]);
                            _local_6 = (((_local_10 >> 16) & 0xFFFF) - 32767);
                            _local_9 = _SafeStr_5728;
                            while (_local_9 > 0)
                            {
                                _arg_1[_arg_2++] = _local_6;
                                _local_9--;
                            };
                            _local_6 = ((_local_10 & 0xFFFF) - 32767);
                            _local_9 = _SafeStr_5728;
                            while (_local_9 > 0)
                            {
                                _arg_1[_arg_2++] = _local_6;
                                _local_9--;
                            };
                        };
                    }
                    else
                    {
                        if (_SafeStr_5727 == 4)
                        {
                            while (_local_8-- > 0)
                            {
                                _local_10 = int(_sampleData[_arg_4++]);
                                _local_6 = ((((_local_10 >> 24) & 0xFF) - 127) << 8);
                                _local_9 = _SafeStr_5728;
                                while (_local_9 > 0)
                                {
                                    _arg_1[_arg_2++] = _local_6;
                                    _local_9--;
                                };
                                _local_6 = ((((_local_10 >> 16) & 0xFF) - 127) << 8);
                                _local_9 = _SafeStr_5728;
                                while (_local_9 > 0)
                                {
                                    _arg_1[_arg_2++] = _local_6;
                                    _local_9--;
                                };
                                _local_6 = ((((_local_10 >> 8) & 0xFF) - 127) << 8);
                                _local_9 = _SafeStr_5728;
                                while (_local_9 > 0)
                                {
                                    _arg_1[_arg_2++] = _local_6;
                                    _local_9--;
                                };
                                _local_6 = (((_local_10 & 0xFF) - 127) << 8);
                                _local_9 = _SafeStr_5728;
                                while (_local_9 > 0)
                                {
                                    _arg_1[_arg_2++] = _local_6;
                                    _local_9--;
                                };
                            };
                        };
                    };
                };
            };
            while (_local_7-- > 0)
            {
                _arg_1[_arg_2++] = 0;
            };
            return (_arg_4 * _local_5);
        }

        public function addSample(_arg_1:Vector.<int>, _arg_2:int, _arg_3:int, _arg_4:int):int
        {
            var _local_9:int;
            var _local_8:int;
            var _local_6:int;
            if (((_arg_1 == null) || (_sampleData == null)))
            {
                return (_arg_4);
            };
            var _local_5:int = (_SafeStr_5727 * _SafeStr_5728);
            _arg_4 = int((_arg_4 / _local_5));
            if (_arg_2 < 0)
            {
                _arg_3 = (_arg_3 + _arg_2);
                _arg_2 = 0;
            };
            if (_arg_3 > (_arg_1.length - _arg_2))
            {
                _arg_3 = (_arg_1.length - _arg_2);
            };
            var _local_7:int = int((_arg_3 / _local_5));
            if (_local_7 > (_sampleData.length - _arg_4))
            {
                _local_7 = (_sampleData.length - _arg_4);
            };
            if (_SafeStr_5728 == 1)
            {
                if (_SafeStr_5727 == 2)
                {
                    while (_local_7-- > 0)
                    {
                        _local_9 = int(_sampleData[_arg_4++]);
                        var _local_10:* = _arg_2++;
                        var _local_11:* = (_arg_1[_local_10] + (((_local_9 >> 16) & 0xFFFF) - 32767));
                        _arg_1[_local_10] = _local_11;
                        _local_11 = _arg_2++;
                        _local_10 = (_arg_1[_local_11] + ((_local_9 & 0xFFFF) - 32767));
                        _arg_1[_local_11] = _local_10;
                    };
                }
                else
                {
                    if (_SafeStr_5727 == 4)
                    {
                        while (_local_7-- > 0)
                        {
                            _local_9 = int(_sampleData[_arg_4++]);
                            _local_10 = _arg_2++;
                            _local_11 = (_arg_1[_local_10] + ((((_local_9 >> 24) & 0xFF) - 127) << 8));
                            _arg_1[_local_10] = _local_11;
                            _local_11 = _arg_2++;
                            _local_10 = (_arg_1[_local_11] + ((((_local_9 >> 16) & 0xFF) - 127) << 8));
                            _arg_1[_local_11] = _local_10;
                            _local_10 = _arg_2++;
                            _local_11 = (_arg_1[_local_10] + ((((_local_9 >> 8) & 0xFF) - 127) << 8));
                            _arg_1[_local_10] = _local_11;
                            _local_11 = _arg_2++;
                            _local_10 = (_arg_1[_local_11] + (((_local_9 & 0xFF) - 127) << 8));
                            _arg_1[_local_11] = _local_10;
                        };
                    };
                };
            }
            else
            {
                if (_SafeStr_5728 >= 2)
                {
                    _local_8 = 0;
                    _local_6 = 0;
                    if (_SafeStr_5727 == 2)
                    {
                        while (_local_7-- > 0)
                        {
                            _local_9 = int(_sampleData[_arg_4++]);
                            _local_6 = (((_local_9 >> 16) & 0xFFFF) - 32767);
                            _local_8 = _SafeStr_5728;
                            while (_local_8 > 0)
                            {
                                _local_10 = _arg_2++;
                                _local_11 = (_arg_1[_local_10] + _local_6);
                                _arg_1[_local_10] = _local_11;
                                _local_8--;
                            };
                            _local_6 = ((_local_9 & 0xFFFF) - 32767);
                            _local_8 = _SafeStr_5728;
                            while (_local_8 > 0)
                            {
                                _local_11 = _arg_2++;
                                _local_10 = (_arg_1[_local_11] + _local_6);
                                _arg_1[_local_11] = _local_10;
                                _local_8--;
                            };
                        };
                    }
                    else
                    {
                        if (_SafeStr_5727 == 4)
                        {
                            while (_local_7-- > 0)
                            {
                                _local_9 = int(_sampleData[_arg_4++]);
                                _local_6 = ((((_local_9 >> 24) & 0xFF) - 127) << 8);
                                _local_8 = _SafeStr_5728;
                                while (_local_8 > 0)
                                {
                                    _local_10 = _arg_2++;
                                    _local_11 = (_arg_1[_local_10] + _local_6);
                                    _arg_1[_local_10] = _local_11;
                                    _local_8--;
                                };
                                _local_6 = ((((_local_9 >> 16) & 0xFF) - 127) << 8);
                                _local_8 = _SafeStr_5728;
                                while (_local_8 > 0)
                                {
                                    _local_11 = _arg_2++;
                                    _local_10 = (_arg_1[_local_11] + _local_6);
                                    _arg_1[_local_11] = _local_10;
                                    _local_8--;
                                };
                                _local_6 = ((((_local_9 >> 8) & 0xFF) - 127) << 8);
                                _local_8 = _SafeStr_5728;
                                while (_local_8 > 0)
                                {
                                    _local_10 = _arg_2++;
                                    _local_11 = (_arg_1[_local_10] + _local_6);
                                    _arg_1[_local_10] = _local_11;
                                    _local_8--;
                                };
                                _local_6 = (((_local_9 & 0xFF) - 127) << 8);
                                _local_8 = _SafeStr_5728;
                                while (_local_8 > 0)
                                {
                                    _local_11 = _arg_2++;
                                    _local_10 = (_arg_1[_local_11] + _local_6);
                                    _arg_1[_local_11] = _local_10;
                                    _local_8--;
                                };
                            };
                        };
                    };
                };
            };
            return (_arg_4 * _local_5);
        }

        public function setUsageFromSong(_arg_1:int, _arg_2:uint):void
        {
            if (_SafeStr_5729 == null)
            {
                return;
            };
            if (_SafeStr_5729.indexOf(_arg_1) == -1)
            {
                _SafeStr_5729.push(_arg_1);
            };
            _SafeStr_5730 = _arg_2;
        }

        public function isUsedFromSong(_arg_1:int):Boolean
        {
            if (_SafeStr_5729 == null)
            {
                return (false);
            };
            return (!(_SafeStr_5729.indexOf(_arg_1) == -1));
        }


    }
}//package com.sulake.habbo.sound.trax

// _SafeStr_13 = "_-P1N" (String#326, DoABC#4)
// _SafeStr_3820 = "_-t1q" (String#209, DoABC#4)
// _SafeStr_5727 = "_-02Q" (String#3913, DoABC#4)
// _SafeStr_5728 = "_-wA" (String#2813, DoABC#4)
// _SafeStr_5729 = "_-H3" (String#6958, DoABC#4)
// _SafeStr_5730 = "_-H1L" (String#22444, DoABC#4)


