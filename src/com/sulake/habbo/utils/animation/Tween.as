// Decompiled by AS3 Sorcerer 6.30
// www.as3sorcerer.com

//com.sulake.habbo.utils.animation.Tween

package com.sulake.habbo.utils.animation
{
    import flash.events.EventDispatcher;
    import __AS3__.vec.Vector;
    import flash.events.Event;

    public class Tween extends EventDispatcher implements _SafeStr_66 
    {

        private static const HINT_MARKER:String = "#";

        private static var _SafeStr_9109:Vector.<Tween> = new Vector.<Tween>(0);

        private const REMOVE_FROM_JUGGLER:String = "REMOVE_FROM_JUGGLER";

        private var _SafeStr_9110:Object;
        private var _SafeStr_9111:Function;
        private var mTransitionName:String;
        private var _SafeStr_9112:Vector.<String>;
        private var _SafeStr_9113:Vector.<Number>;
        private var _SafeStr_9114:Vector.<Number>;
        private var _SafeStr_9115:Vector.<Function>;
        private var _SafeStr_9116:Function;
        private var mOnUpdate:Function;
        private var _SafeStr_9117:Function;
        private var _SafeStr_9118:Function;
        private var _SafeStr_9119:Array;
        private var _SafeStr_9120:Array;
        private var _SafeStr_9121:Array;
        private var _SafeStr_9122:Array;
        private var mTotalTime:Number;
        private var mCurrentTime:Number;
        private var _SafeStr_9123:Number;
        private var _SafeStr_9124:Number;
        private var _SafeStr_9125:Boolean;
        private var mNextTween:Tween;
        private var _SafeStr_9096:int;
        private var _SafeStr_9126:Number;
        private var _SafeStr_9127:Boolean;
        private var _SafeStr_9128:int;

        public function Tween(_arg_1:Object, _arg_2:Number, _arg_3:Object="linear")
        {
            reset(_arg_1, _arg_2, _arg_3);
        }

        internal static function getPropertyHint(_arg_1:String):String
        {
            if (((!(_arg_1.indexOf("color") == -1)) || (!(_arg_1.indexOf("Color") == -1))))
            {
                return ("rgb");
            };
            var _local_2:int = _arg_1.indexOf("#");
            if (_local_2 != -1)
            {
                return (_arg_1.substr((_local_2 + 1)));
            };
            return (null);
        }

        internal static function getPropertyName(_arg_1:String):String
        {
            var _local_2:int = _arg_1.indexOf("#");
            if (_local_2 != -1)
            {
                return (_arg_1.substring(0, _local_2));
            };
            return (_arg_1);
        }

        internal static function fromPool(_arg_1:Object, _arg_2:Number, _arg_3:Object="linear"):Tween
        {
            if (_SafeStr_9109.length)
            {
                return (_SafeStr_9109.pop().reset(_arg_1, _arg_2, _arg_3));
            };
            return (new Tween(_arg_1, _arg_2, _arg_3));
        }

        internal static function toPool(_arg_1:Tween):void
        {
            var _local_2:* = null;
            _arg_1._SafeStr_9118 = _local_2;
            _arg_1._SafeStr_9117 = _local_2;
            _arg_1.mOnUpdate = _local_2;
            _arg_1._SafeStr_9116 = _local_2;
            _local_2 = null;
            _arg_1._SafeStr_9122 = _local_2;
            _arg_1._SafeStr_9121 = _local_2;
            _arg_1._SafeStr_9120 = _local_2;
            _arg_1._SafeStr_9119 = _local_2;
            _arg_1._SafeStr_9110 = null;
            _arg_1._SafeStr_9111 = null;
            _SafeStr_9109.push(_arg_1);
        }


        public function reset(_arg_1:Object, _arg_2:Number, _arg_3:Object="linear"):Tween
        {
            _SafeStr_9110 = _arg_1;
            mCurrentTime = 0;
            mTotalTime = Math.max(0.0001, _arg_2);
            _SafeStr_9123 = 0;
            _SafeStr_9124 = (_SafeStr_9126 = 0);
            _SafeStr_9116 = (mOnUpdate = (_SafeStr_9117 = (_SafeStr_9118 = null)));
            _SafeStr_9119 = (_SafeStr_9120 = (_SafeStr_9121 = (_SafeStr_9122 = null)));
            _SafeStr_9125 = (_SafeStr_9127 = false);
            _SafeStr_9096 = 1;
            _SafeStr_9128 = -1;
            mNextTween = null;
            if ((_arg_3 is String))
            {
                this.transition = (_arg_3 as String);
            }
            else
            {
                if ((_arg_3 is Function))
                {
                    this.transitionFunc = (_arg_3 as Function);
                }
                else
                {
                    throw (new ArgumentError("Transition must be either a string or a function"));
                };
            };
            if (_SafeStr_9112)
            {
                _SafeStr_9112.length = 0;
            }
            else
            {
                _SafeStr_9112 = new Vector.<String>(0);
            };
            if (_SafeStr_9113)
            {
                _SafeStr_9113.length = 0;
            }
            else
            {
                _SafeStr_9113 = new Vector.<Number>(0);
            };
            if (_SafeStr_9114)
            {
                _SafeStr_9114.length = 0;
            }
            else
            {
                _SafeStr_9114 = new Vector.<Number>(0);
            };
            if (_SafeStr_9115)
            {
                _SafeStr_9115.length = 0;
            }
            else
            {
                _SafeStr_9115 = new Vector.<Function>(0);
            };
            return (this);
        }

        public function animate(_arg_1:String, _arg_2:Number):void
        {
            if (_SafeStr_9110 == null)
            {
                return;
            };
            var _local_3:int = _SafeStr_9112.length;
            var _local_4:Function = getUpdateFuncFromProperty(_arg_1);
            _SafeStr_9112[_local_3] = getPropertyName(_arg_1);
            _SafeStr_9113[_local_3] = NaN;
            _SafeStr_9114[_local_3] = _arg_2;
            _SafeStr_9115[_local_3] = _local_4;
        }

        public function scaleTo(_arg_1:Number):void
        {
            animate("scaleX", _arg_1);
            animate("scaleY", _arg_1);
        }

        public function moveTo(_arg_1:Number, _arg_2:Number):void
        {
            animate("x", _arg_1);
            animate("y", _arg_2);
        }

        public function fadeTo(_arg_1:Number):void
        {
            animate("alpha", _arg_1);
        }

        public function rotateTo(_arg_1:Number, _arg_2:String="rad"):void
        {
            animate(("rotation#" + _arg_2), _arg_1);
        }

        public function advanceTime(_arg_1:Number):void
        {
            var _local_6:int;
            var _local_7:* = null;
            var _local_5:* = null;
            var _local_8:* = null;
            if (((_arg_1 == 0) || ((_SafeStr_9096 == 1) && (mCurrentTime == mTotalTime))))
            {
                return;
            };
            var _local_3:Number = mCurrentTime;
            var _local_2:Number = (mTotalTime - mCurrentTime);
            var _local_10:Number = ((_arg_1 > _local_2) ? (_arg_1 - _local_2) : 0);
            mCurrentTime = (mCurrentTime + _arg_1);
            if (mCurrentTime <= 0)
            {
                return;
            };
            if (mCurrentTime > mTotalTime)
            {
                mCurrentTime = mTotalTime;
            };
            if ((((_SafeStr_9128 < 0) && (_local_3 <= 0)) && (mCurrentTime > 0)))
            {
                _SafeStr_9128++;
                if (_SafeStr_9116 != null)
                {
                    _SafeStr_9116.apply(this, _SafeStr_9119);
                };
            };
            var _local_11:Number = (mCurrentTime / mTotalTime);
            var _local_9:Boolean = ((_SafeStr_9127) && ((_SafeStr_9128 % 2) == 1));
            var _local_4:int = _SafeStr_9113.length;
            _SafeStr_9123 = ((_local_9) ? _SafeStr_9111((1 - _local_11)) : _SafeStr_9111(_local_11));
            _local_6 = 0;
            while (_local_6 < _local_4)
            {
                if (_SafeStr_9113[_local_6] != _SafeStr_9113[_local_6])
                {
                    _SafeStr_9113[_local_6] = (_SafeStr_9110[_SafeStr_9112[_local_6]] as Number);
                };
                _local_7 = (_SafeStr_9115[_local_6] as Function);
                (_local_7(_SafeStr_9112[_local_6], _SafeStr_9113[_local_6], _SafeStr_9114[_local_6]));
                _local_6++;
            };
            if (mOnUpdate != null)
            {
                mOnUpdate.apply(this, _SafeStr_9120);
            };
            if (((_local_3 < mTotalTime) && (mCurrentTime >= mTotalTime)))
            {
                if (((_SafeStr_9096 == 0) || (_SafeStr_9096 > 1)))
                {
                    mCurrentTime = -(_SafeStr_9126);
                    _SafeStr_9128++;
                    if (_SafeStr_9096 > 1)
                    {
                        _SafeStr_9096--;
                    };
                    if (_SafeStr_9117 != null)
                    {
                        _SafeStr_9117.apply(this, _SafeStr_9121);
                    };
                }
                else
                {
                    _local_5 = _SafeStr_9118;
                    _local_8 = _SafeStr_9122;
                    dispatchEvent(new Event("REMOVE_FROM_JUGGLER"));
                    if (_local_5 != null)
                    {
                        _local_5.apply(this, _local_8);
                    };
                    if (mCurrentTime == 0)
                    {
                        _local_10 = 0;
                    };
                };
            };
            if (_local_10)
            {
                advanceTime(_local_10);
            };
        }

        private function getUpdateFuncFromProperty(_arg_1:String):Function
        {
            var _local_3:* = null;
            var _local_2:String = getPropertyHint(_arg_1);
            switch (_local_2)
            {
                case null:
                    _local_3 = updateStandard;
                    break;
                case "rgb":
                    _local_3 = updateRgb;
                    break;
                case "rad":
                    _local_3 = updateRad;
                    break;
                case "deg":
                    _local_3 = updateDeg;
                    break;
                default:
                    (trace("[Starling] Ignoring unknown property hint:", _local_2));
                    _local_3 = updateStandard;
            };
            return (_local_3);
        }

        private function updateStandard(_arg_1:String, _arg_2:Number, _arg_3:Number):void
        {
            var _local_4:Number = (_arg_2 + (_SafeStr_9123 * (_arg_3 - _arg_2)));
            if (_SafeStr_9125)
            {
                _local_4 = Math.round(_local_4);
            };
            _SafeStr_9110[_arg_1] = _local_4;
        }

        private function updateRgb(_arg_1:String, _arg_2:Number, _arg_3:Number):void
        {
            var _local_11:uint = _arg_2;
            var _local_6:uint = _arg_3;
            var _local_13:uint = ((_local_11 >> 24) & 0xFF);
            var _local_17:uint = ((_local_11 >> 16) & 0xFF);
            var _local_7:uint = ((_local_11 >> 8) & 0xFF);
            var _local_10:uint = (_local_11 & 0xFF);
            var _local_9:uint = ((_local_6 >> 24) & 0xFF);
            var _local_16:uint = ((_local_6 >> 16) & 0xFF);
            var _local_5:uint = ((_local_6 >> 8) & 0xFF);
            var _local_8:uint = (_local_6 & 0xFF);
            var _local_14:uint = (_local_13 + ((_local_9 - _local_13) * _SafeStr_9123));
            var _local_4:uint = (_local_17 + ((_local_16 - _local_17) * _SafeStr_9123));
            var _local_15:uint = (_local_7 + ((_local_5 - _local_7) * _SafeStr_9123));
            var _local_12:uint = (_local_10 + ((_local_8 - _local_10) * _SafeStr_9123));
            _SafeStr_9110[_arg_1] = ((((_local_14 << 24) | (_local_4 << 16)) | (_local_15 << 8)) | _local_12);
        }

        private function updateRad(_arg_1:String, _arg_2:Number, _arg_3:Number):void
        {
            updateAngle(3.14159265358979, _arg_1, _arg_2, _arg_3);
        }

        private function updateDeg(_arg_1:String, _arg_2:Number, _arg_3:Number):void
        {
            updateAngle(180, _arg_1, _arg_2, _arg_3);
        }

        private function updateAngle(_arg_1:Number, _arg_2:String, _arg_3:Number, _arg_4:Number):void
        {
            while (Math.abs((_arg_4 - _arg_3)) > _arg_1)
            {
                if (_arg_3 < _arg_4)
                {
                    _arg_4 = (_arg_4 - (2 * _arg_1));
                }
                else
                {
                    _arg_4 = (_arg_4 + (2 * _arg_1));
                };
            };
            updateStandard(_arg_2, _arg_3, _arg_4);
        }

        public function getEndValue(_arg_1:String):Number
        {
            var _local_2:int = _SafeStr_9112.indexOf(_arg_1);
            if (_local_2 == -1)
            {
                throw (new ArgumentError((("The property '" + _arg_1) + "' is not animated")));
            };
            return (_SafeStr_9114[_local_2] as Number);
        }

        public function get isComplete():Boolean
        {
            return ((mCurrentTime >= mTotalTime) && (_SafeStr_9096 == 1));
        }

        public function get target():Object
        {
            return (_SafeStr_9110);
        }

        public function get transition():String
        {
            return (mTransitionName);
        }

        public function set transition(_arg_1:String):void
        {
            mTransitionName = _arg_1;
            _SafeStr_9111 = Transitions.getTransition(_arg_1);
            if (_SafeStr_9111 == null)
            {
                throw (new ArgumentError(("Invalid transiton: " + _arg_1)));
            };
        }

        public function get transitionFunc():Function
        {
            return (_SafeStr_9111);
        }

        public function set transitionFunc(_arg_1:Function):void
        {
            mTransitionName = "custom";
            _SafeStr_9111 = _arg_1;
        }

        public function get totalTime():Number
        {
            return (mTotalTime);
        }

        public function get currentTime():Number
        {
            return (mCurrentTime);
        }

        public function get progress():Number
        {
            return (_SafeStr_9123);
        }

        public function get delay():Number
        {
            return (_SafeStr_9124);
        }

        public function set delay(_arg_1:Number):void
        {
            mCurrentTime = ((mCurrentTime + _SafeStr_9124) - _arg_1);
            _SafeStr_9124 = _arg_1;
        }

        public function get repeatCount():int
        {
            return (_SafeStr_9096);
        }

        public function set repeatCount(_arg_1:int):void
        {
            _SafeStr_9096 = _arg_1;
        }

        public function get repeatDelay():Number
        {
            return (_SafeStr_9126);
        }

        public function set repeatDelay(_arg_1:Number):void
        {
            _SafeStr_9126 = _arg_1;
        }

        public function get reverse():Boolean
        {
            return (_SafeStr_9127);
        }

        public function set reverse(_arg_1:Boolean):void
        {
            _SafeStr_9127 = _arg_1;
        }

        public function get roundToInt():Boolean
        {
            return (_SafeStr_9125);
        }

        public function set roundToInt(_arg_1:Boolean):void
        {
            _SafeStr_9125 = _arg_1;
        }

        public function get onStart():Function
        {
            return (_SafeStr_9116);
        }

        public function set onStart(_arg_1:Function):void
        {
            _SafeStr_9116 = _arg_1;
        }

        public function get onUpdate():Function
        {
            return (mOnUpdate);
        }

        public function set onUpdate(_arg_1:Function):void
        {
            mOnUpdate = _arg_1;
        }

        public function get onRepeat():Function
        {
            return (_SafeStr_9117);
        }

        public function set onRepeat(_arg_1:Function):void
        {
            _SafeStr_9117 = _arg_1;
        }

        public function get onComplete():Function
        {
            return (_SafeStr_9118);
        }

        public function set onComplete(_arg_1:Function):void
        {
            _SafeStr_9118 = _arg_1;
        }

        public function get onStartArgs():Array
        {
            return (_SafeStr_9119);
        }

        public function set onStartArgs(_arg_1:Array):void
        {
            _SafeStr_9119 = _arg_1;
        }

        public function get onUpdateArgs():Array
        {
            return (_SafeStr_9120);
        }

        public function set onUpdateArgs(_arg_1:Array):void
        {
            _SafeStr_9120 = _arg_1;
        }

        public function get onRepeatArgs():Array
        {
            return (_SafeStr_9121);
        }

        public function set onRepeatArgs(_arg_1:Array):void
        {
            _SafeStr_9121 = _arg_1;
        }

        public function get onCompleteArgs():Array
        {
            return (_SafeStr_9122);
        }

        public function set onCompleteArgs(_arg_1:Array):void
        {
            _SafeStr_9122 = _arg_1;
        }

        public function get nextTween():Tween
        {
            return (mNextTween);
        }

        public function set nextTween(_arg_1:Tween):void
        {
            mNextTween = _arg_1;
        }


    }
}//package com.sulake.habbo.utils.animation

// _SafeStr_66 = "_-61q" (String#6974, DoABC#3)
// _SafeStr_9096 = "_-ll" (String#9783, DoABC#3)
// _SafeStr_9109 = "_-Z1n" (String#8912, DoABC#3)
// _SafeStr_9110 = "_-tQ" (String#10284, DoABC#3)
// _SafeStr_9111 = "_-XT" (String#8807, DoABC#3)
// _SafeStr_9112 = "_-u1Q" (String#10314, DoABC#3)
// _SafeStr_9113 = "_-n1b" (String#9881, DoABC#3)
// _SafeStr_9114 = "_-hn" (String#9505, DoABC#3)
// _SafeStr_9115 = "_-914" (String#7153, DoABC#3)
// _SafeStr_9116 = "_-B1y" (String#7323, DoABC#3)
// _SafeStr_9117 = "_-TW" (String#8522, DoABC#3)
// _SafeStr_9118 = "_-A1F" (String#7216, DoABC#3)
// _SafeStr_9119 = "_-S1o" (String#8421, DoABC#3)
// _SafeStr_9120 = "_-Gb" (String#7637, DoABC#3)
// _SafeStr_9121 = "_-f1a" (String#9340, DoABC#3)
// _SafeStr_9122 = "_-U2" (String#8565, DoABC#3)
// _SafeStr_9123 = "_-41l" (String#6830, DoABC#3)
// _SafeStr_9124 = "_-31S" (String#6720, DoABC#3)
// _SafeStr_9125 = "_-C10" (String#7352, DoABC#3)
// _SafeStr_9126 = "_-hJ" (String#9493, DoABC#3)
// _SafeStr_9127 = "_-k1r" (String#9689, DoABC#3)
// _SafeStr_9128 = "_-jE" (String#9618, DoABC#3)


