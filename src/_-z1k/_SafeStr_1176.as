// Decompiled by AS3 Sorcerer 6.30
// www.as3sorcerer.com

//_-z1k._SafeStr_1176

package _-z1k
{
    import com.sulake.core.communication.messages.IMessageParser;
    import _-81g._SafeStr_1624;
    import com.sulake.core.communication.messages.IMessageDataWrapper;

    [SecureSWF(rename="true")]
    public class _SafeStr_1176 implements IMessageParser 
    {

        private var _SafeStr_4233:int = 0;
        private var _SafeStr_4022:Array = [];


        public function get presetCount():int
        {
            return (_SafeStr_4022.length);
        }

        public function get selectedPresetId():int
        {
            return (_SafeStr_4233);
        }

        public function getPreset(_arg_1:int):_SafeStr_1624
        {
            if (((_arg_1 < 0) || (_arg_1 >= presetCount)))
            {
                return (null);
            };
            return (_SafeStr_4022[_arg_1]);
        }

        public function flush():Boolean
        {
            _SafeStr_4022 = [];
            return (true);
        }

        public function parse(_arg_1:IMessageDataWrapper):Boolean
        {
            var _local_5:int;
            var _local_7:int;
            var _local_9:int;
            var _local_6:* = null;
            var _local_2:int;
            var _local_3:int;
            var _local_8:* = null;
            var _local_4:int = _arg_1.readInteger();
            _SafeStr_4233 = _arg_1.readInteger();
            _local_5 = 0;
            while (_local_5 < _local_4)
            {
                _local_7 = _arg_1.readInteger();
                _local_9 = _arg_1.readInteger();
                _local_6 = _arg_1.readString();
                _local_2 = parseInt(_local_6.substr(1), 16);
                _local_3 = _arg_1.readInteger();
                _local_8 = new _SafeStr_1624(_local_7);
                _local_8.type = _local_9;
                _local_8.color = _local_2;
                _local_8.light = _local_3;
                _local_8.setReadOnly();
                _SafeStr_4022.push(_local_8);
                _local_5++;
            };
            return (true);
        }


    }
}//package _-z1k

// _SafeStr_1176 = "_-K1T" (String#7874, DoABC#3)
// _SafeStr_1624 = "_-61j" (String#6969, DoABC#3)
// _SafeStr_4022 = "_-3L" (String#6770, DoABC#3)
// _SafeStr_4233 = "_-Tw" (String#8537, DoABC#3)


