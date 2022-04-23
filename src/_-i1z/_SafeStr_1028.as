// Decompiled by AS3 Sorcerer 6.30
// www.as3sorcerer.com

//_-i1z._SafeStr_1028

package _-i1z
{
    import com.sulake.core.communication.messages.IMessageComposer;

    [SecureSWF(rename="true")]
    public class _SafeStr_1028 implements IMessageComposer 
    {

        private const _SafeStr_7264:int = 5;

        private var _SafeStr_7263:Array;

        public function _SafeStr_1028()
        {
            _SafeStr_7263 = [];
        }

        public function addActivatedBadge(_arg_1:String):void
        {
            if (_SafeStr_7263.length >= 5)
            {
                return;
            };
            _SafeStr_7263.push(_arg_1);
        }

        public function dispose():void
        {
        }

        public function getMessageArray():Array
        {
            var _local_2:int;
            var _local_1:Array = [];
            _local_2 = 1;
            while (_local_2 <= 5)
            {
                if (_local_2 <= _SafeStr_7263.length)
                {
                    _local_1.push(_local_2);
                    _local_1.push(_SafeStr_7263[(_local_2 - 1)]);
                }
                else
                {
                    _local_1.push(_local_2);
                    _local_1.push("");
                };
                _local_2++;
            };
            return (_local_1);
        }


    }
}//package _-i1z

// _SafeStr_1028 = "_-h1v" (String#9482, DoABC#3)
// _SafeStr_7263 = "_-01P" (String#6479, DoABC#3)
// _SafeStr_7264 = "_-9e" (String#7197, DoABC#3)


