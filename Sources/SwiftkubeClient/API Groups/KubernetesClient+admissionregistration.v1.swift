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

// MARK: - AdmissionRegistrationV1API

public protocol AdmissionRegistrationV1API: Sendable {

	var mutatingWebhookConfigurations: ClusterScopedGenericKubernetesClient<admissionregistration.v1.MutatingWebhookConfiguration> { get }
	var validatingAdmissionPolicies: ClusterScopedGenericKubernetesClient<admissionregistration.v1.ValidatingAdmissionPolicy> { get }
	var validatingAdmissionPolicyBindings: ClusterScopedGenericKubernetesClient<admissionregistration.v1.ValidatingAdmissionPolicyBinding> { get }
	var validatingWebhookConfigurations: ClusterScopedGenericKubernetesClient<admissionregistration.v1.ValidatingWebhookConfiguration> { get }
}

/// DSL for `admissionregistration.k8s.io.v1` API Group
public extension KubernetesClient {

	final class AdmissionRegistrationV1: AdmissionRegistrationV1API {
		private let client: KubernetesClient

		internal init(_ client: KubernetesClient) {
			self.client = client
		}

		public var mutatingWebhookConfigurations: ClusterScopedGenericKubernetesClient<admissionregistration.v1.MutatingWebhookConfiguration> {
			client.clusterScoped(for: admissionregistration.v1.MutatingWebhookConfiguration.self)
		}

		public var validatingAdmissionPolicies: ClusterScopedGenericKubernetesClient<admissionregistration.v1.ValidatingAdmissionPolicy> {
			client.clusterScoped(for: admissionregistration.v1.ValidatingAdmissionPolicy.self)
		}

		public var validatingAdmissionPolicyBindings: ClusterScopedGenericKubernetesClient<admissionregistration.v1.ValidatingAdmissionPolicyBinding> {
			client.clusterScoped(for: admissionregistration.v1.ValidatingAdmissionPolicyBinding.self)
		}

		public var validatingWebhookConfigurations: ClusterScopedGenericKubernetesClient<admissionregistration.v1.ValidatingWebhookConfiguration> {
			client.clusterScoped(for: admissionregistration.v1.ValidatingWebhookConfiguration.self)
		}
	}

	var admissionRegistrationV1: AdmissionRegistrationV1API {
		AdmissionRegistrationV1(self)
	}
}
