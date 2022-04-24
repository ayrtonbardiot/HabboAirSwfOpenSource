// by nota

//com.sulake.air._SafeStr_12

package com.sulake.air
{
    import com.sulake.habbo.utils.IEncryptedLocalStorage;
    import flash.data.EncryptedLocalStore;
    import flash.utils.ByteArray;

    public class _SafeStr_12 implements IEncryptedLocalStorage 
    {


        public static function isSupported():Boolean
        {
            try
            {
                return (EncryptedLocalStore.isSupported);
            }
            catch(e:Error)
            {
                return (false);
            };
            return (false);
        }


        public function reset():void
        {
            if (EncryptedLocalStore.isSupported)
            {
                try
                {
                    EncryptedLocalStore.reset();
                }
                catch(e:Error)
                {
                    _SafeStr_14.log(("Error resetting the EncryptedLocalStore: " + e.toString()));
                };
            };
        }

        public function storeString(_arg_1:String, _arg_2:String):Boolean
        {
            var _local_3:* = null;
            try
            {
                if (EncryptedLocalStore.isSupported)
                {
                    _local_3 = new ByteArray();
                    if (_arg_2 != null)
                    {
                        _local_3.writeUTF(_arg_2);
                    };
                    EncryptedLocalStore.setItem(_arg_1, _local_3);
                    var _local_5:Boolean = true;
                    return (_local_5);
                };
                var _local_6:Boolean = false;
                return (_local_6);
            }
            catch(e:Error)
            {
                _SafeStr_14.log(((((("Error storing to the EncryptedLocalStore with key " + _arg_1) + " and value ") + _arg_2) + ", error: ") + e.toString()));
                return (false);
            };
            return (false);
        }

        public function restoreString(_arg_1:String):String
        {
            var _local_2:* = null;
            try
            {
                if (EncryptedLocalStore.isSupported)
                {
                    _local_2 = EncryptedLocalStore.getItem(_arg_1);
                    if (_local_2)
                    {
                        var _local_4:* = _local_2.readUTF();
                        return (_local_4);
                    };
                };
                var _local_5:* = null;
                return (_local_5);
            }
            catch(e:Error)
            {
                _SafeStr_14.log(((("Error restoring from the EncryptedLocalStore with key " + _arg_1) + ", error: ") + e.toString()));
                return (null);
            };
            return (null);
        }


    }
}//package com.sulake.air

// _SafeStr_12 = "_-dC" (String#9231, DoABC#3)
// _SafeStr_14 = "_-ED" (String#7490, DoABC#3)


