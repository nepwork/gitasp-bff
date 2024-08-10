export interface TIndexData {
  id: string;
  slug: string;
  body: string;
  collection: string;
  data: {
    title: string;
    description: string;
    authors: string[];
    categories: string[];
    tags: string[];
  };
  render: () => Promise<void>;
};

export interface TPostData {
  title: string;
  meta_title: string;
  description: string;
  image: string;
};

export interface TPost {
  id: string;
  slug: string;
  body: string;
  collection: string;
  data: PostData;
  render: () => Promise<void>;
};

export interface TFaqItem {
  title: string;
  answer: string;
};

export interface TPostType {
  id: string;
  slug: string;
  body: string;
  collection: string;
  data: {
    title: string;
    draft: boolean;
    faqs: FaqItem[];
    description?: string;
    workflow?: TWorkflow;
    plans?: TPlan[];
  };
};

export interface TWorkflow {
  title: string;
  image: string;
  description: string;
}

export interface TPlan {
  title: string;
  subtitle: string;
  price: number;
  recommended: boolean;
  type: string;
  features: string[];
  button: {
    label: string;
    link: string;
  };
};

export interface TCallToAction {
  title: string;
  content: string;
  image: string;
  button: {
    enable: boolean;
    label: string;
    link: string;
  };
};
