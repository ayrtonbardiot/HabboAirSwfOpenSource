// by nota

//com.sulake.habbo.room.object.visualization.furniture.FurnitureMannequinVisualization

package com.sulake.habbo.room.object.visualization.furniture
{
    import com.sulake.habbo.avatar._SafeStr_1875;
    import flash.utils.Dictionary;
    import com.sulake.habbo.avatar._SafeStr_3138;
    import com.sulake.room.object.visualization.IRoomObjectVisualizationData;
    import com.sulake.room.object.IRoomObject;

    public class FurnitureMannequinVisualization extends FurnitureVisualization implements _SafeStr_1875 
    {

        private static const AVATAR_IMAGE_SPRITE_TAG:String = "avatar_image";

        private static var _customPlaceholders:Dictionary;
        private static var _SafeStr_4611:int;

        private const MANNEQUIN_BODY:String = "hd-99999-99998";

        private var _SafeStr_3819:String;
        private var _SafeStr_3834:String;
        private var _SafeStr_4045:int;
        private var _needsUpdate:Boolean = false;
        private var _dynamicAssetName:String;
        private var _SafeStr_3740:AvatarFurnitureVisualizationData;
        private var _SafeStr_4036:Boolean = false;

        public function FurnitureMannequinVisualization()
        {
            _SafeStr_4611++;
        }

        public function get disposed():Boolean
        {
            return (_SafeStr_4036);
        }

        override public function dispose():void
        {
            if (!_SafeStr_4036)
            {
                _SafeStr_3740 = null;
                _SafeStr_4036 = true;
                if (((_dynamicAssetName) && (assetCollection)))
                {
                    assetCollection.disposeAsset(_dynamicAssetName);
                    _dynamicAssetName = null;
                };
                super.dispose();
                _SafeStr_4611--;
                if (((_SafeStr_4611 == 0) && (_customPlaceholders)))
                {
                    for each (var _local_1:_SafeStr_3138 in _customPlaceholders)
                    {
                        _local_1.dispose();
                    };
                    _customPlaceholders = null;
                };
            };
        }

        override public function initialize(_arg_1:IRoomObjectVisualizationData):Boolean
        {
            _SafeStr_3740 = (_arg_1 as AvatarFurnitureVisualizationData);
            super.initialize(_arg_1);
            return (true);
        }

        override protected function updateObject(_arg_1:Number, _arg_2:Number):Boolean
        {
            var _local_3:Boolean = super.updateObject(_arg_1, _arg_2);
            if (_local_3)
            {
                if (_SafeStr_4045 != _arg_1)
                {
                    _SafeStr_4045 = _arg_1;
                    addAvatarAsset();
                };
            };
            return (_local_3);
        }

        private function addAvatarAsset(_arg_1:Boolean=false):void
        {
            var _local_3:* = null;
            var _local_2:* = null;
            if (((!(isAvatarAssetReady())) || (_arg_1)))
            {
                _local_3 = _SafeStr_3740.getAvatar(_SafeStr_3819, _SafeStr_4045, _SafeStr_3834, this);
                if (_local_3)
                {
                    if (_local_3.isPlaceholder())
                    {
                        _local_3.dispose();
                        _local_2 = getCustomPlaceholder(_SafeStr_4045);
                        _local_2.setDirection("full", direction);
                        assetCollection.addAsset(getAvatarAssetName(), _local_2.getImage("full", true), true);
                        _needsUpdate = true;
                        return;
                    };
                    _local_3.setDirection("full", direction);
                    if (_dynamicAssetName)
                    {
                        assetCollection.disposeAsset(_dynamicAssetName);
                    };
                    assetCollection.addAsset(getAvatarAssetName(), _local_3.getImage("full", true), true);
                    _dynamicAssetName = getAvatarAssetName();
                    _needsUpdate = true;
                    _local_3.dispose();
                };
            };
        }

        override public function getSpriteList():Array
        {
            var _local_1:_SafeStr_3138 = _SafeStr_3740.getAvatar(_SafeStr_3819, _SafeStr_4045, _SafeStr_3834, this);
            if (_local_1 == null)
            {
                return (super.getSpriteList());
            };
            _local_1.setDirection("full", direction);
            return (_local_1.getServerRenderData());
        }

        private function getCustomPlaceholder(_arg_1:int):_SafeStr_3138
        {
            if (!_customPlaceholders)
            {
                _customPlaceholders = new Dictionary();
            };
            var _local_2:_SafeStr_3138 = _customPlaceholders[_arg_1];
            if (_local_2 == null)
            {
                _local_2 = _SafeStr_3740.getAvatar("hd-99999-99998", _arg_1, null, null);
                _customPlaceholders[_arg_1] = _local_2;
            };
            return (_local_2);
        }

        override protected function updateModel(_arg_1:Number):Boolean
        {
            var _local_3:* = null;
            var _local_4:* = null;
            var _local_2:* = null;
            var _local_5:Boolean = super.updateModel(_arg_1);
            if (_local_5)
            {
                _local_3 = object;
                if (_local_3 != null)
                {
                    _local_4 = _local_3.getModel();
                    if (_local_4 != null)
                    {
                        _local_2 = _local_4.getString("furniture_mannequin_figure");
                        if (_local_2)
                        {
                            _SafeStr_3834 = _local_4.getString("furniture_mannequin_gender");
                            _SafeStr_3819 = ((_local_2 + ".") + "hd-99999-99998");
                            addAvatarAsset();
                        };
                    };
                };
            };
            if (!_local_5)
            {
                _local_5 = _needsUpdate;
            };
            _needsUpdate = false;
            return (_local_5);
        }

        private function isAvatarAssetReady():Boolean
        {
            return ((_SafeStr_3819) && (!(getAsset(getAvatarAssetName()) == null)));
        }

        override protected function getSpriteAssetName(_arg_1:int, _arg_2:int):String
        {
            var _local_3:String = getSpriteTag(_arg_1, direction, _arg_2);
            if ((((!(_SafeStr_3819 == null)) && (_local_3 == "avatar_image")) && (isAvatarAssetReady())))
            {
                return (getAvatarAssetName());
            };
            return (super.getSpriteAssetName(_arg_1, _arg_2));
        }

        private function getAvatarAssetName():String
        {
            var _local_1:IRoomObject = object;
            if (!_local_1)
            {
                return (null);
            };
            return ((((((("mannequin_" + _SafeStr_3819) + "_") + _SafeStr_4045) + "_") + direction) + "_") + _local_1.getId());
        }

        public function avatarImageReady(_arg_1:String):void
        {
            if (_arg_1 == _SafeStr_3819)
            {
                addAvatarAsset(true);
            };
        }

        override protected function getSpriteXOffset(_arg_1:int, _arg_2:int, _arg_3:int):int
        {
            var _local_4:String = getSpriteTag(_arg_1, _arg_2, _arg_3);
            if (((_local_4 == "avatar_image") && (isAvatarAssetReady())))
            {
                return (-(getSprite(_arg_3).width) / 2);
            };
            return (super.getSpriteXOffset(_arg_1, _arg_2, _arg_3));
        }

        override protected function getSpriteYOffset(_arg_1:int, _arg_2:int, _arg_3:int):int
        {
            var _local_4:String = getSpriteTag(_arg_1, _arg_2, _arg_3);
            if (((_local_4 == "avatar_image") && (isAvatarAssetReady())))
            {
                return (-(getSprite(_arg_3).height));
            };
            return (super.getSpriteYOffset(_arg_1, _arg_2, _arg_3));
        }


    }
}//package com.sulake.habbo.room.object.visualization.furniture

// _SafeStr_1875 = "_-R1S" (String#2190, DoABC#4)
// _SafeStr_3138 = "_-L1S" (String#1270, DoABC#4)
// _SafeStr_3740 = "_-vf" (String#93, DoABC#4)
// _SafeStr_3819 = "_-T8" (String#697, DoABC#4)
// _SafeStr_3834 = "_-tK" (String#1203, DoABC#4)
// _SafeStr_4036 = "_-Mr" (String#290, DoABC#4)
// _SafeStr_4045 = "_-22r" (String#725, DoABC#4)
// _SafeStr_4611 = "_-32i" (String#9796, DoABC#4)


