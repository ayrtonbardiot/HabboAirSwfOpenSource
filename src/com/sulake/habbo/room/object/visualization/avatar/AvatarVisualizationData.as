// Decompiled by AS3 Sorcerer 6.30
// www.as3sorcerer.com

//com.sulake.habbo.room.object.visualization.avatar.AvatarVisualizationData

package com.sulake.habbo.room.object.visualization.avatar
{
    import com.sulake.room.object.visualization.IRoomObjectVisualizationData;
    import com.sulake.habbo.avatar._SafeStr_1701;
    import com.sulake.habbo.avatar._SafeStr_1875;
    import com.sulake.habbo.avatar._SafeStr_3139;
    import com.sulake.habbo.avatar._SafeStr_3138;
    import com.sulake.core.assets.IAsset;

    public class AvatarVisualizationData implements IRoomObjectVisualizationData 
    {

        private var _avatarRenderer:_SafeStr_1701 = null;


        public function get avatarRenderer():_SafeStr_1701
        {
            return (_avatarRenderer);
        }

        public function set avatarRenderer(_arg_1:_SafeStr_1701):void
        {
            _avatarRenderer = _arg_1;
        }

        public function initialize(_arg_1:XML):Boolean
        {
            return (true);
        }

        public function dispose():void
        {
            _avatarRenderer = null;
        }

        public function getAvatar(_arg_1:String, _arg_2:Number, _arg_3:String=null, _arg_4:_SafeStr_1875=null, _arg_5:_SafeStr_3139=null):_SafeStr_3138
        {
            var _local_6:* = null;
            if (_avatarRenderer != null)
            {
                _local_6 = null;
                if (_arg_2 > 48)
                {
                    _local_6 = _avatarRenderer.createAvatarImage(_arg_1, "h", _arg_3, _arg_4, _arg_5);
                }
                else
                {
                    _local_6 = _avatarRenderer.createAvatarImage(_arg_1, "h_50", _arg_3, _arg_4, _arg_5);
                };
                return (_local_6);
            };
            return (null);
        }

        public function getLayerCount(_arg_1:String):Number
        {
            return (0);
        }

        public function getAvatarRendererAsset(_arg_1:String):IAsset
        {
            if (_avatarRenderer == null)
            {
                return (null);
            };
            return (_avatarRenderer.assets.getAssetByName(_arg_1));
        }


    }
}//package com.sulake.habbo.room.object.visualization.avatar

// _SafeStr_1701 = "_-FF" (String#1596, DoABC#4)
// _SafeStr_1875 = "_-R1S" (String#2190, DoABC#4)
// _SafeStr_3138 = "_-L1S" (String#1270, DoABC#4)
// _SafeStr_3139 = "_-7b" (String#5555, DoABC#4)


