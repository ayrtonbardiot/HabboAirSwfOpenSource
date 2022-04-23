// Decompiled by AS3 Sorcerer 6.30
// www.as3sorcerer.com

//com.sulake.habbo.avatar.nft.NftAvatarsModel

package com.sulake.habbo.avatar.nft
{
    import com.sulake.habbo.avatar.common.CategoryBaseModel;
    import com.sulake.habbo.avatar.common._SafeStr_3301;
    import _-T1p._SafeStr_235;
    import com.sulake.habbo.avatar.HabboAvatarEditor;
    import _-GV.GetUserNftWardrobeMessageComposer;
    import _-a1U.NftWardrobeItem;
    import com.sulake.habbo.avatar.wardrobe.NftOutfit;
    import com.sulake.habbo.avatar.common.CategoryData;

    public class NftAvatarsModel extends CategoryBaseModel implements _SafeStr_3301 
    {

        private var _nftAvatars:Array;
        private var _SafeStr_6519:_SafeStr_235;

        public function NftAvatarsModel(_arg_1:HabboAvatarEditor)
        {
            super(_arg_1);
            _nftAvatars = [];
            requestNftAvatars(_arg_1);
        }

        private function requestNftAvatars(_arg_1:HabboAvatarEditor):void
        {
            _SafeStr_6519 = new _SafeStr_235(onUserNftWardrobeMessage);
            _arg_1.manager.communication.addHabboConnectionMessageEvent(_SafeStr_6519);
            _arg_1.manager.communication.connection.send(new GetUserNftWardrobeMessageComposer());
        }

        private function onUserNftWardrobeMessage(_arg_1:_SafeStr_235):void
        {
            for each (var _local_2:NftWardrobeItem in _arg_1.getParser().nftAvatars)
            {
                _nftAvatars.push(new NftOutfit(_SafeStr_4360, _local_2.tokenId, _local_2.figureString, _local_2.gender));
            };
        }

        override public function dispose():void
        {
            if (((controller) && (_SafeStr_6519)))
            {
                controller.manager.communication.removeHabboConnectionMessageEvent(_SafeStr_6519);
                _SafeStr_6519 = null;
            };
            _nftAvatars = null;
            super.dispose();
        }

        override protected function init():void
        {
            if (!_SafeStr_3882)
            {
                _SafeStr_3882 = new NftAvatarsView(this);
            };
            _SafeStr_3882.init();
            _SafeStr_3883 = true;
        }

        public function selectNftAvatar(_arg_1:int):void
        {
            var _local_2:NftOutfit = _nftAvatars[_arg_1];
            if (_local_2 != null)
            {
                if (_local_2.figure == "")
                {
                    return;
                };
                _SafeStr_4360.setNftOutfit(_local_2);
                _SafeStr_4360.loadAvatarInEditor(_local_2.figure, _local_2.gender, _SafeStr_4360.clubMemberLevel);
            };
        }

        public function getNftAvatarByTokenId(_arg_1:int):NftOutfit
        {
            var _local_3:uint;
            var _local_2:* = null;
            _local_3 = 0;
            while (_local_3 <= _nftAvatars.length)
            {
                _local_2 = _nftAvatars[_local_3];
                if (_local_2.tokenId == _arg_1)
                {
                    return (_local_2);
                };
                _local_3++;
            };
            return (null);
        }

        public function get nftAvatars():Array
        {
            return (_nftAvatars);
        }

        override public function switchCategory(_arg_1:String=""):void
        {
        }

        override public function getCategoryData(_arg_1:String):CategoryData
        {
            return (null);
        }

        override public function selectPart(_arg_1:String, _arg_2:int):void
        {
        }


    }
}//package com.sulake.habbo.avatar.nft

// _SafeStr_235 = "_-ib" (String#18077, DoABC#4)
// _SafeStr_3301 = "_-f1d" (String#2199, DoABC#4)
// _SafeStr_3882 = "_-D10" (String#53, DoABC#4)
// _SafeStr_3883 = "_-w1c" (String#683, DoABC#4)
// _SafeStr_4360 = "_-58" (String#91, DoABC#4)
// _SafeStr_6519 = "_-cg" (String#10220, DoABC#4)


