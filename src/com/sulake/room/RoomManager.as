// Decompiled by AS3 Sorcerer 6.30
// www.as3sorcerer.com

//com.sulake.room.RoomManager

package com.sulake.room
{
    import com.sulake.core.runtime._SafeStr_20;
    import com.sulake.core.utils._SafeStr_24;
    import __AS3__.vec.Vector;
    import com.sulake.room.object.IRoomObjectVisualizationFactory;
    import com.sulake.core.runtime._SafeStr_31;
    import com.sulake.core.runtime.ComponentDependency;
    import com.sulake.iid.IIDRoomObjectFactory;
    import com.sulake.iid.IIDRoomObjectVisualizationFactory;
    import com.sulake.room.exceptions.RoomManagerException;
    import com.sulake.room.object.visualization.utils.IGraphicAssetCollection;
    import com.sulake.room.object.IRoomObject;
    import com.sulake.room.object.IRoomObjectController;
    import com.sulake.room.object.visualization.IRoomObjectGraphicVisualization;
    import com.sulake.room.object.visualization.IRoomObjectVisualizationData;
    import com.sulake.room.object.logic.IRoomObjectEventHandler;
    import com.sulake.room.events.RoomContentLoadedEvent;
    import flash.utils.getTimer;
    import com.sulake.iid.*;

    public class RoomManager extends _SafeStr_20 implements IRoomManager, IRoomInstanceContainer 
    {

        public static const ROOM_MANAGER_ERROR:int = -1;
        public static const ROOM_MANAGER_LOADING:int = 0;
        public static const ROOM_MANAGER_LOADED:int = 1;
        public static const ROOM_MANAGER_INITIALIZING:int = 2;
        public static const ROOM_MANAGER_INITIALIZED:int = 3;
        private static const CONTENT_PROCESSING_TIME_LIMIT_MILLISECONDS:int = 40;

        private var _rooms:_SafeStr_24;
        private var _SafeStr_3735:IRoomContentLoader;
        private var _SafeStr_3736:Vector.<String>;
        private var _SafeStr_3737:Vector.<int>;
        private var _SafeStr_3987:int;
        private var _SafeStr_3733:IRoomManagerListener;
        private var _objectFactory:IRoomObjectFactory = null;
        private var _visualizationFactory:IRoomObjectVisualizationFactory = null;
        private var _SafeStr_3734:int = 0;
        private var _SafeStr_3732:XML = null;
        private var _SafeStr_3738:Vector.<String> = new Vector.<String>();
        private var _skipContentProcessingForNextFrame:Boolean = false;
        private var _SafeStr_3739:Boolean = true;
        private var _disposed:Boolean = false;

        public function RoomManager(_arg_1:_SafeStr_31, _arg_2:uint=0)
        {
            super(_arg_1, _arg_2);
            _rooms = new _SafeStr_24();
            _SafeStr_3736 = new Vector.<String>();
            _SafeStr_3737 = new Vector.<int>();
            events.addEventListener("RCLE_SUCCESS", onContentLoaded);
            events.addEventListener("RCLE_FAILURE", onContentLoaded);
            events.addEventListener("RCLE_CANCEL", onContentLoaded);
        }

        override public function get disposed():Boolean
        {
            return (_disposed);
        }

        public function set limitContentProcessing(_arg_1:Boolean):void
        {
            _SafeStr_3739 = _arg_1;
        }

        override protected function get dependencies():Vector.<ComponentDependency>
        {
            return (super.dependencies.concat(new <ComponentDependency>[new ComponentDependency(new IIDRoomObjectFactory(), function (_arg_1:IRoomObjectFactory):void
            {
                _objectFactory = _arg_1;
            }), new ComponentDependency(new IIDRoomObjectVisualizationFactory(), function (_arg_1:IRoomObjectVisualizationFactory):void
            {
                _visualizationFactory = _arg_1;
            })]));
        }

        override protected function initComponent():void
        {
            var _local_1:* = null;
            _SafeStr_3734 = 1;
            if (_SafeStr_3732 != null)
            {
                _local_1 = _SafeStr_3732;
                _SafeStr_3732 = null;
                initialize(_local_1, _SafeStr_3733);
            };
        }

        override public function dispose():void
        {
            if (disposed)
            {
                return;
            };
            if (_rooms != null)
            {
                for each (var _local_1:IRoomInstance in _rooms)
                {
                    if (_local_1 != null)
                    {
                        _local_1.dispose();
                    };
                };
                _rooms.dispose();
                _rooms = null;
            };
            _SafeStr_3733 = null;
            _SafeStr_3736 = null;
            _SafeStr_3737 = null;
            _SafeStr_3735 = null;
            super.dispose();
        }

        public function initialize(_arg_1:XML, _arg_2:IRoomManagerListener):Boolean
        {
            var _local_4:int;
            var _local_5:* = null;
            if (_SafeStr_3734 == 0)
            {
                if (_SafeStr_3732 != null)
                {
                    return (false);
                };
                _SafeStr_3732 = _arg_1;
                _SafeStr_3733 = _arg_2;
                return (true);
            };
            if (_SafeStr_3734 >= 2)
            {
                return (false);
            };
            if (_arg_1 == null)
            {
                return (false);
            };
            if (_SafeStr_3735 == null)
            {
                return (false);
            };
            _SafeStr_3987 = 50;
            _SafeStr_3733 = _arg_2;
            var _local_3:Array = _SafeStr_3735.getPlaceHolderTypes();
            _local_4 = 0;
            while (_local_4 < _local_3.length)
            {
                _local_5 = _local_3[_local_4];
                if (_SafeStr_3736.indexOf(_local_5) < 0)
                {
                    _SafeStr_3735.loadObjectContent(_local_5, events);
                    _SafeStr_3736.push(_local_5);
                };
                _local_4++;
            };
            _SafeStr_3734 = 2;
            return (true);
        }

        public function setContentLoader(_arg_1:IRoomContentLoader):void
        {
            if (_SafeStr_3735 != null)
            {
                _SafeStr_3735.dispose();
            };
            _SafeStr_3735 = _arg_1;
        }

        public function addObjectUpdateCategory(_arg_1:int):void
        {
            var _local_3:int;
            var _local_4:* = null;
            var _local_2:int = _SafeStr_3737.indexOf(_arg_1);
            if (_local_2 >= 0)
            {
                return;
            };
            _SafeStr_3737.push(_arg_1);
            _local_3 = (_rooms.length - 1);
            while (_local_3 >= 0)
            {
                _local_4 = (_rooms.getWithIndex(_local_3) as RoomInstance);
                if (_local_4 != null)
                {
                    _local_4.addObjectUpdateCategory(_arg_1);
                };
                _local_3--;
            };
        }

        public function removeObjectUpdateCategory(_arg_1:int):void
        {
            var _local_3:int;
            var _local_4:* = null;
            var _local_2:int = _SafeStr_3737.indexOf(_arg_1);
            if (_local_2 < 0)
            {
                return;
            };
            _SafeStr_3737.splice(_local_2, 1);
            _local_3 = (_rooms.length - 1);
            while (_local_3 >= 0)
            {
                _local_4 = (_rooms.getWithIndex(_local_3) as RoomInstance);
                if (_local_4 != null)
                {
                    _local_4.removeObjectUpdateCategory(_arg_1);
                };
                _local_3--;
            };
        }

        public function createRoom(_arg_1:String, _arg_2:XML):IRoomInstance
        {
            var _local_3:int;
            var _local_4:int;
            if (_SafeStr_3734 < 3)
            {
                throw (new RoomManagerException());
            };
            if (_rooms.getValue(_arg_1) != null)
            {
                return (null);
            };
            var _local_5:RoomInstance = new RoomInstance(_arg_1, this);
            _rooms.add(_arg_1, _local_5);
            _local_3 = (_SafeStr_3737.length - 1);
            while (_local_3 >= 0)
            {
                _local_4 = _SafeStr_3737[_local_3];
                _local_5.addObjectUpdateCategory(_local_4);
                _local_3--;
            };
            return (_local_5);
        }

        public function getRoom(_arg_1:String):IRoomInstance
        {
            return (_rooms.getValue(_arg_1) as IRoomInstance);
        }

        public function getRoomWithIndex(_arg_1:int):IRoomInstance
        {
            return (_rooms.getWithIndex(_arg_1));
        }

        public function getRoomCount():int
        {
            return (_rooms.length);
        }

        public function disposeRoom(_arg_1:String):Boolean
        {
            var _local_2:IRoomInstance = (_rooms.remove(_arg_1) as IRoomInstance);
            if (_local_2 != null)
            {
                _local_2.dispose();
                return (true);
            };
            return (false);
        }

        public function createRoomObject(_arg_1:String, _arg_2:int, _arg_3:String, _arg_4:int):IRoomObject
        {
            if (_SafeStr_3734 < 3)
            {
                throw (new RoomManagerException());
            };
            var _local_11:IRoomInstance = getRoom(_arg_1);
            if (_local_11 == null)
            {
                return (null);
            };
            if (_SafeStr_3735 == null)
            {
                return (null);
            };
            var _local_7:RoomInstance = (_local_11 as RoomInstance);
            if (_local_7 == null)
            {
                return (null);
            };
            var _local_10:IGraphicAssetCollection;
            var _local_15:XML;
            var _local_12:XML;
            var _local_9:String;
            var _local_14:String;
            var _local_5:* = _arg_3;
            var _local_16:Boolean;
            if (!_SafeStr_3735.hasInternalContent(_arg_3))
            {
                _local_10 = _SafeStr_3735.getGraphicAssetCollection(_arg_3);
                if (_local_10 == null)
                {
                    _local_16 = true;
                    _SafeStr_3735.loadObjectContent(_arg_3, events);
                    _local_5 = _SafeStr_3735.getPlaceHolderType(_arg_3);
                    _local_10 = _SafeStr_3735.getGraphicAssetCollection(_local_5);
                };
                _local_15 = _SafeStr_3735.getVisualizationXML(_local_5);
                _local_12 = _SafeStr_3735.getLogicXML(_local_5);
                if (((_local_15 == null) || (_local_10 == null)))
                {
                    return (null);
                };
                _local_9 = _SafeStr_3735.getVisualizationType(_local_5);
                _local_14 = _SafeStr_3735.getLogicType(_local_5);
            }
            else
            {
                _local_9 = _arg_3;
                _local_14 = _arg_3;
            };
            var _local_17:int = 1;
            var _local_19:IRoomObject = _local_7.createObjectInternal(_arg_2, _local_17, _arg_3, _arg_4);
            var _local_13:IRoomObjectController = (_local_19 as IRoomObjectController);
            if (_local_13 == null)
            {
                return (null);
            };
            var _local_8:IRoomObjectGraphicVisualization = _visualizationFactory.createRoomObjectVisualization(_local_9);
            if (_local_8 == null)
            {
                _local_11.disposeObject(_arg_2, _arg_4);
                return (null);
            };
            _local_8.assetCollection = _local_10;
            _local_8.setExternalBaseUrls(context.configuration.getProperty("stories.image_url_base"), context.configuration.getProperty("extra_data_service_url"), context.configuration.getBoolean("extra_data_batches_enabled"));
            var _local_6:IRoomObjectVisualizationData;
            _local_6 = _visualizationFactory.getRoomObjectVisualizationData(_local_5, _local_9, _local_15);
            if (!_local_8.initialize(_local_6))
            {
                _local_11.disposeObject(_arg_2, _arg_4);
                return (null);
            };
            _local_13.setVisualization(_local_8);
            var _local_18:IRoomObjectEventHandler = _objectFactory.createRoomObjectLogic(_local_14);
            _local_13.setEventHandler(_local_18);
            if (((!(_local_18 == null)) && (!(_local_12 == null))))
            {
                _local_18.initialize(_local_12);
            };
            if (!_local_16)
            {
                _local_13.setInitialized(true);
            };
            _SafeStr_3735.roomObjectCreated(_local_13, _arg_1);
            return (_local_13);
        }

        public function createRoomObjectManager():IRoomObjectManager
        {
            if (_objectFactory != null)
            {
                return (_objectFactory.createRoomObjectManager());
            };
            return (null);
        }

        public function isContentAvailable(_arg_1:String):Boolean
        {
            if (_SafeStr_3735 != null)
            {
                if (_SafeStr_3735.getGraphicAssetCollection(_arg_1) != null)
                {
                    return (true);
                };
            };
            return (false);
        }

        private function processInitialContentLoad(_arg_1:String):void
        {
            var _local_2:int;
            if (_arg_1 == null)
            {
                return;
            };
            if (_SafeStr_3734 == -1)
            {
                return;
            };
            if (_SafeStr_3735 == null)
            {
                _SafeStr_3734 = -1;
                return;
            };
            if (_SafeStr_3735.getGraphicAssetCollection(_arg_1) != null)
            {
                _local_2 = _SafeStr_3736.indexOf(_arg_1);
                if (_local_2 >= 0)
                {
                    _SafeStr_3736.splice(_local_2, 1);
                };
                if (_SafeStr_3736.length == 0)
                {
                    _SafeStr_3734 = 3;
                    if (_SafeStr_3733 != null)
                    {
                        _SafeStr_3733.roomManagerInitialized(true);
                    };
                };
            }
            else
            {
                _SafeStr_3734 = -1;
                _SafeStr_3733.roomManagerInitialized(false);
            };
        }

        private function onContentLoaded(_arg_1:RoomContentLoadedEvent):void
        {
            if (_SafeStr_3735 == null)
            {
                return;
            };
            var _local_2:String = _arg_1.contentType;
            if (_local_2 == null)
            {
                if (_SafeStr_3733 != null)
                {
                    _SafeStr_3733.contentLoaded(null, false);
                };
                return;
            };
            if (_SafeStr_3738.indexOf(_local_2) < 0)
            {
                _SafeStr_3738.push(_local_2);
            };
        }

        private function processLoadedContentTypes():void
        {
            var _local_4:* = null;
            var _local_3:* = null;
            var _local_1:int;
            if (_skipContentProcessingForNextFrame)
            {
                _skipContentProcessingForNextFrame = false;
                return;
            };
            var _local_2:int = getTimer();
            while (_SafeStr_3738.length > 0)
            {
                _local_4 = _SafeStr_3738[0];
                _SafeStr_3738.splice(0, 1);
                if (!_SafeStr_3735.hasVisualizationXML(_local_4))
                {
                    if (_SafeStr_3733 != null)
                    {
                        _SafeStr_3733.contentLoaded(_local_4, false);
                    };
                    return;
                };
                _local_3 = _SafeStr_3735.getGraphicAssetCollection(_local_4);
                if (_local_3 == null)
                {
                    if (_SafeStr_3733 != null)
                    {
                        _SafeStr_3733.contentLoaded(_local_4, false);
                    };
                    return;
                };
                updateObjectContents(_local_4);
                if (_SafeStr_3733 != null)
                {
                    _SafeStr_3733.contentLoaded(_local_4, true);
                };
                if (_SafeStr_3736.length > 0)
                {
                    processInitialContentLoad(_local_4);
                };
                _local_1 = getTimer();
                if ((((_local_1 - _local_2) >= 40) && (_SafeStr_3739)))
                {
                    _skipContentProcessingForNextFrame = true;
                    return;
                };
            };
        }

        private function updateObjectContents(_arg_1:String):void
        {
            var _local_12:* = null;
            var _local_8:* = null;
            var _local_2:* = null;
            var _local_14:* = null;
            var _local_17:int;
            var _local_9:* = null;
            var _local_11:* = null;
            var _local_15:* = null;
            var _local_10:Boolean;
            var _local_4:int;
            var _local_7:int;
            var _local_18:* = null;
            var _local_5:* = null;
            var _local_3:* = null;
            if (_arg_1 == null)
            {
                return;
            };
            if (((_SafeStr_3735 == null) || (_visualizationFactory == null)))
            {
                return;
            };
            var _local_6:String = _SafeStr_3735.getVisualizationType(_arg_1);
            var _local_13:String = _SafeStr_3735.getLogicType(_arg_1);
            _local_17 = (_rooms.length - 1);
            while (_local_17 >= 0)
            {
                _local_9 = (_rooms.getWithIndex(_local_17) as RoomInstance);
                _local_11 = _rooms.getKey(_local_17);
                if (_local_9 != null)
                {
                    _local_15 = _local_9.getObjectManagerIds();
                    _local_10 = false;
                    for each (var _local_16:int in _local_15)
                    {
                        _local_4 = _local_9.getObjectCountForType(_arg_1, _local_16);
                        _local_7 = (_local_4 - 1);
                        while (_local_7 >= 0)
                        {
                            _local_18 = (_local_9.getObjectWithIndexAndType(_local_7, _arg_1, _local_16) as IRoomObjectController);
                            if (_local_18 != null)
                            {
                                if (!_local_2)
                                {
                                    _local_14 = _SafeStr_3735.getVisualizationXML(_arg_1);
                                    if (_local_14 == null)
                                    {
                                        return;
                                    };
                                    _local_12 = _SafeStr_3735.getLogicXML(_arg_1);
                                    _local_8 = _SafeStr_3735.getGraphicAssetCollection(_arg_1);
                                    if (_local_8 == null)
                                    {
                                        return;
                                    };
                                    _local_2 = _visualizationFactory.getRoomObjectVisualizationData(_arg_1, _local_6, _local_14);
                                };
                                _local_5 = _visualizationFactory.createRoomObjectVisualization(_local_6);
                                if (_local_5 != null)
                                {
                                    _local_5.assetCollection = _local_8;
                                    _local_5.setExternalBaseUrls(context.configuration.getProperty("stories.image_url_base"), context.configuration.getProperty("extra_data_service_url"), context.configuration.getBoolean("extra_data_batches_enabled"));
                                    if (!_local_5.initialize(_local_2))
                                    {
                                        _local_9.disposeObject(_local_18.getId(), _local_16);
                                    }
                                    else
                                    {
                                        _local_18.setVisualization(_local_5);
                                        _local_3 = _objectFactory.createRoomObjectLogic(_local_13);
                                        _local_18.setEventHandler(_local_3);
                                        if (_local_3 != null)
                                        {
                                            _local_3.initialize(_local_12);
                                        };
                                        _local_18.setInitialized(true);
                                        if (_SafeStr_3733 != null)
                                        {
                                            _SafeStr_3733.objectInitialized(_local_11, _local_18.getId(), _local_16);
                                            _local_10 = true;
                                        };
                                    };
                                }
                                else
                                {
                                    _local_9.disposeObject(_local_18.getId(), _local_16);
                                };
                            };
                            _local_7--;
                        };
                    };
                    if (((!(_local_9.hasUninitializedObjects())) && (_local_10)))
                    {
                        _SafeStr_3733.objectsInitialized(_local_11);
                    };
                };
                _local_17--;
            };
        }

        public function update(_arg_1:uint):void
        {
            var _local_2:int;
            var _local_3:* = null;
            processLoadedContentTypes();
            _local_2 = (_rooms.length - 1);
            while (_local_2 >= 0)
            {
                _local_3 = (_rooms.getWithIndex(_local_2) as RoomInstance);
                if (_local_3 != null)
                {
                    _local_3.update();
                };
                _local_2--;
            };
        }


    }
}//package com.sulake.room

// _SafeStr_20 = "_-W1o" (String#542, DoABC#4)
// _SafeStr_24 = "_-W1s" (String#60, DoABC#4)
// _SafeStr_31 = "_-Ee" (String#1238, DoABC#4)
// _SafeStr_3732 = "_-r3" (String#9803, DoABC#4)
// _SafeStr_3733 = "_-a1J" (String#2230, DoABC#4)
// _SafeStr_3734 = "_-g1U" (String#198, DoABC#4)
// _SafeStr_3735 = "_-eS" (String#2493, DoABC#4)
// _SafeStr_3736 = "_-nh" (String#6849, DoABC#4)
// _SafeStr_3737 = "_-lm" (String#3571, DoABC#4)
// _SafeStr_3738 = "_-w1J" (String#9689, DoABC#4)
// _SafeStr_3739 = "_-tG" (String#18473, DoABC#4)
// _SafeStr_3987 = "_-U4" (String#2995, DoABC#4)


