// Decompiled by AS3 Sorcerer 6.30
// www.as3sorcerer.com

//_-FJ._SafeStr_835

package _-FJ
{
    import com.sulake.core.communication.messages.IMessageComposer;
    import com.sulake.core.runtime._SafeStr_13;
    import __AS3__.vec.Vector;

    [SecureSWF(rename="true")]
    public class _SafeStr_835 implements IMessageComposer, _SafeStr_13 
    {

        private var _SafeStr_6600:Array = [];

        public function _SafeStr_835(_arg_1:int, _arg_2:Vector.<int>)
        {
            var _local_3:int;
            super();
            _SafeStr_6600.push(_arg_1);
            _SafeStr_6600.push(_arg_2.length);
            _local_3 = 0;
            while (_local_3 < _arg_2.length)
            {
                _SafeStr_6600.push(_arg_2[_local_3]);
                _local_3++;
            };
        }

        public function getMessageArray():Array
        {
            return (this._SafeStr_6600);
        }

        public function dispose():void
        {
            this._SafeStr_6600 = null;
        }

        public function get disposed():Boolean
        {
            return (false);
        }


    }
}//package _-FJ

// _SafeStr_13 = "_-P1N" (String#8235, DoABC#3)
// _SafeStr_6600 = "_-91h" (String#56, DoABC#3)
// _SafeStr_835 = "_-sH" (String#10215, DoABC#3)


