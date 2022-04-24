// by nota

//com.sulake.habbo.utils.animation.DelayedCall

package com.sulake.habbo.utils.animation
{
    import flash.events.EventDispatcher;
    import __AS3__.vec.Vector;
    import flash.events.Event;

    public class DelayedCall extends EventDispatcher implements _SafeStr_66 
    {

        private static var _SafeStr_9093:Vector.<DelayedCall> = new Vector.<DelayedCall>(0);

        private var mCurrentTime:Number;
        private var mTotalTime:Number;
        private var _SafeStr_9094:Function;
        private var _SafeStr_9095:Array;
        private var _SafeStr_9096:int;

        public function DelayedCall(_arg_1:Function, _arg_2:Number, _arg_3:Array=null)
        {
            reset(_arg_1, _arg_2, _arg_3);
        }

        internal static function fromPool(_arg_1:Function, _arg_2:Number, _arg_3:Array=null):DelayedCall
        {
            if (_SafeStr_9093.length)
            {
                return (_SafeStr_9093.pop().reset(_arg_1, _arg_2, _arg_3));
            };
            return (new DelayedCall(_arg_1, _arg_2, _arg_3));
        }

        internal static function toPool(_arg_1:DelayedCall):void
        {
            _arg_1._SafeStr_9094 = null;
            _arg_1._SafeStr_9095 = null;
            _arg_1.removeEventListeners();
            _SafeStr_9093.push(_arg_1);
        }


        public function reset(_arg_1:Function, _arg_2:Number, _arg_3:Array=null):DelayedCall
        {
            mCurrentTime = 0;
            mTotalTime = Math.max(_arg_2, 0.0001);
            _SafeStr_9094 = _arg_1;
            _SafeStr_9095 = _arg_3;
            _SafeStr_9096 = 1;
            return (this);
        }

        public function advanceTime(_arg_1:Number):void
        {
            var _local_2:* = null;
            var _local_3:* = null;
            var _local_4:Number = mCurrentTime;
            mCurrentTime = (mCurrentTime + _arg_1);
            if (mCurrentTime > mTotalTime)
            {
                mCurrentTime = mTotalTime;
            };
            if (((_local_4 < mTotalTime) && (mCurrentTime >= mTotalTime)))
            {
                if (((_SafeStr_9096 == 0) || (_SafeStr_9096 > 1)))
                {
                    _SafeStr_9094.apply(null, _SafeStr_9095);
                    if (_SafeStr_9096 > 0)
                    {
                        _SafeStr_9096 = (_SafeStr_9096 - 1);
                    };
                    mCurrentTime = 0;
                    advanceTime(((_local_4 + _arg_1) - mTotalTime));
                }
                else
                {
                    _local_2 = _SafeStr_9094;
                    _local_3 = _SafeStr_9095;
                    dispatchEvent(new Event("REMOVE_FROM_JUGGLER"));
                    _local_2.apply(null, _local_3);
                };
            };
        }

        public function complete():void
        {
            var _local_1:Number = (mTotalTime - mCurrentTime);
            if (_local_1 > 0)
            {
                advanceTime(_local_1);
            };
        }

        public function get isComplete():Boolean
        {
            return ((_SafeStr_9096 == 1) && (mCurrentTime >= mTotalTime));
        }

        public function get totalTime():Number
        {
            return (mTotalTime);
        }

        public function get currentTime():Number
        {
            return (mCurrentTime);
        }

        public function get repeatCount():int
        {
            return (_SafeStr_9096);
        }

        public function set repeatCount(_arg_1:int):void
        {
            _SafeStr_9096 = _arg_1;
        }

        private function removeEventListeners():void
        {
        }


    }
}//package com.sulake.habbo.utils.animation

// _SafeStr_66 = "_-61q" (String#6974, DoABC#3)
// _SafeStr_9093 = "_-G1r" (String#7610, DoABC#3)
// _SafeStr_9094 = "_-7M" (String#7044, DoABC#3)
// _SafeStr_9095 = "_-SD" (String#8438, DoABC#3)
// _SafeStr_9096 = "_-ll" (String#9783, DoABC#3)


