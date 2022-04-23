// Decompiled by AS3 Sorcerer 6.30
// www.as3sorcerer.com

//_-a1U._SafeStr_1455

package _-a1U
{
    import com.sulake.core.communication.messages.IMessageParser;
    import com.sulake.core.communication.messages.IMessageDataWrapper;

    [SecureSWF(rename="true")]
    public class _SafeStr_1455 implements IMessageParser 
    {

        private var _nftAvatars:Array;


        public function flush():Boolean
        {
            _nftAvatars = [];
            return (true);
        }

        public function parse(_arg_1:IMessageDataWrapper):Boolean
        {
            var _local_3:int;
            var _local_2:int = _arg_1.readInteger();
            _local_3 = 0;
            while (_local_3 < _local_2)
            {
                _nftAvatars.push(new NftWardrobeItem(_arg_1));
                _local_3++;
            };
            return (true);
        }

        public function get nftAvatars():Array
        {
            return (_nftAvatars);
        }


    }
}//package _-a1U

// _SafeStr_1455 = "_-sR" (String#10219, DoABC#3)


