// Decompiled by AS3 Sorcerer 6.30
// www.as3sorcerer.com

//com.sulake.core.utils.profiler.ProfilerAgentTask

package com.sulake.core.utils.profiler
{
    import com.sulake.core.runtime._SafeStr_13;
    import flash.utils.getTimer;

    public class ProfilerAgentTask implements _SafeStr_13 
    {

        private var _name:String;
        private var _SafeStr_8069:uint;
        private var _SafeStr_5130:int;
        private var _SafeStr_8070:int;
        private var _SafeStr_8071:Number;
        private var _caption:String;
        private var _SafeStr_4016:Boolean;
        private var _disposed:Boolean = false;
        private var _children:Array;
        private var _startTime:uint;
        private var _paused:Boolean = false;

        public function ProfilerAgentTask(_arg_1:String, _arg_2:String="")
        {
            _name = _arg_1;
            _SafeStr_8069 = 0;
            _SafeStr_8071 = 0;
            _SafeStr_4016 = false;
            _children = [];
            _caption = _arg_2;
        }

        public function dispose():void
        {
            if (!_disposed)
            {
                _disposed = true;
            };
        }

        public function start():void
        {
            if (!_SafeStr_4016)
            {
                _startTime = getTimer();
                _SafeStr_4016 = true;
            };
        }

        public function stop():void
        {
            if (_SafeStr_4016)
            {
                _SafeStr_8070 = (getTimer() - _startTime);
                _SafeStr_8069++;
                _SafeStr_5130 = (_SafeStr_5130 + _SafeStr_8070);
                _SafeStr_8071 = (_SafeStr_5130 / _SafeStr_8069);
                _SafeStr_4016 = false;
            };
        }

        public function get name():String
        {
            return (_name);
        }

        public function get rounds():uint
        {
            return (_SafeStr_8069);
        }

        public function get total():int
        {
            return (_SafeStr_5130);
        }

        public function get latest():int
        {
            return (_SafeStr_8070);
        }

        public function get average():Number
        {
            return (_SafeStr_8071);
        }

        public function get caption():String
        {
            return (_caption);
        }

        public function set caption(_arg_1:String):void
        {
            _caption = caption;
        }

        public function get running():Boolean
        {
            return (_SafeStr_4016);
        }

        public function get disposed():Boolean
        {
            return (_disposed);
        }

        public function get paused():Boolean
        {
            return (_paused);
        }

        public function set paused(_arg_1:Boolean):void
        {
            _paused = _arg_1;
        }

        public function get numSubTasks():uint
        {
            return (_children.length);
        }

        public function addSubTask(_arg_1:ProfilerAgentTask):void
        {
            if (getSubTaskByName(_arg_1.name) != null)
            {
                throw (new Error((('Component profiler task with name "' + _arg_1.name) + '" already exists!')));
            };
            _children.push(_arg_1);
        }

        public function removeSubTask(_arg_1:ProfilerAgentTask):ProfilerAgentTask
        {
            var _local_2:int = _children.indexOf(_arg_1);
            if (_local_2 > -1)
            {
                _children.splice(_local_2, 1);
            };
            return (_arg_1);
        }

        public function getSubTaskAt(_arg_1:uint):ProfilerAgentTask
        {
            return (_children[_arg_1] as ProfilerAgentTask);
        }

        public function getSubTaskByName(_arg_1:String):ProfilerAgentTask
        {
            var _local_2:* = null;
            var _local_3:uint = _children.length;
            var _local_4:uint;
            while (_local_4 < _local_3)
            {
                _local_2 = (_children[_local_4++] as ProfilerAgentTask);
                if (_local_2.name == _arg_1)
                {
                    return (_local_2);
                };
            };
            return (null);
        }


    }
}//package com.sulake.core.utils.profiler

// _SafeStr_13 = "_-P1N" (String#8235, DoABC#3)
// _SafeStr_4016 = "_-z1x" (String#10677, DoABC#3)
// _SafeStr_5130 = "_-N1S" (String#8066, DoABC#3)
// _SafeStr_8069 = "_-41E" (String#6804, DoABC#3)
// _SafeStr_8070 = "_-Cb" (String#7398, DoABC#3)
// _SafeStr_8071 = "_-416" (String#6800, DoABC#3)


