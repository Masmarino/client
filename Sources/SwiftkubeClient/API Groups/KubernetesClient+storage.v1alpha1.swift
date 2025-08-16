//
// Copyright 2025 Swiftkube Project
//
// Licensed under the Apache License, Version 2.0 (the "License");
// you may not use this file except in compliance with the License.
// You may obtain a copy of the License at
//
// http://www.apache.org/licenses/LICENSE-2.0
//
// Unless required by applicable law or agreed to in writing, software
// distributed under the License is distributed on an "AS IS" BASIS,
// WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
// See the License for the specific language governing permissions and
// limitations under the License.
//

import Foundation
import SwiftkubeModel

// MARK: - StorageV1Alpha1API

public protocol StorageV1Alpha1API: Sendable {

	var volumeAttributesClasses: ClusterScopedGenericKubernetesClient<storage.v1alpha1.VolumeAttributesClass> { get }
}

/// DSL for `storage.k8s.io.v1alpha1` API Group
public extension KubernetesClient {

	final class StorageV1Alpha1: StorageV1Alpha1API {
		private let client: KubernetesClient

		internal init(_ client: KubernetesClient) {
			self.client = client
		}

		public var volumeAttributesClasses: ClusterScopedGenericKubernetesClient<storage.v1alpha1.VolumeAttributesClass> {
			client.clusterScoped(for: storage.v1alpha1.VolumeAttributesClass.self)
		}
	}

	var storageV1Alpha1: StorageV1Alpha1API {
		StorageV1Alpha1(self)
	}
}
